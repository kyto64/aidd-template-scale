#!/usr/bin/env node
/**
 * Minimal CDP driver: navigate and check text presence (Node 22+).
 * Usage: node cdp_drive.mjs --url http://localhost:5173/ --expect "Welcome"
 */
import { parseArgs } from 'node:util';

const { values } = parseArgs({
  options: {
    url: { type: 'string' },
    expect: { type: 'string' },
    port: { type: 'string', default: '9222' },
  },
});

const url = values.url;
const expectText = values.expect;
const port = values.port;

if (!url || !expectText) {
  console.error('Usage: node cdp_drive.mjs --url <url> --expect <text> [--port 9222]');
  process.exit(2);
}

const list = await fetch(`http://127.0.0.1:${port}/json/list`).then((r) => r.json());
const page = list.find((t) => t.type === 'page') || list[0];
if (!page?.webSocketDebuggerUrl) {
  console.error('No CDP target. Is launch_chrome.sh running?');
  process.exit(1);
}

const ws = new WebSocket(page.webSocketDebuggerUrl);

let id = 0;
const pending = new Map();

ws.addEventListener('message', (event) => {
  const msg = JSON.parse(event.data);
  if (msg.id && pending.has(msg.id)) {
    const { resolve, reject } = pending.get(msg.id);
    pending.delete(msg.id);
    if (msg.error) reject(msg.error);
    else resolve(msg.result);
  }
});

const send = (method, params = {}) =>
  new Promise((resolve, reject) => {
    const msgId = ++id;
    pending.set(msgId, { resolve, reject });
    ws.send(JSON.stringify({ id: msgId, method, params }));
  });

await new Promise((resolve, reject) => {
  ws.addEventListener('open', resolve, { once: true });
  ws.addEventListener('error', reject, { once: true });
});

try {
  await send('Page.navigate', { url });
  await new Promise((r) => setTimeout(r, 1500));
  const result = await send('Runtime.evaluate', {
    expression: 'document.body.innerText',
    returnByValue: true,
  });
  const text = result?.value || '';
  if (text.includes(expectText)) {
    console.log(`PASS: found "${expectText}" on ${url}`);
    process.exit(0);
  }
  console.error(`FAIL: "${expectText}" not found on ${url}`);
  process.exit(1);
} catch (e) {
  console.error(e);
  process.exit(1);
} finally {
  ws.close();
}
