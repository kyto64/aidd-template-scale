import { defineConfig } from 'vitepress'
import path from 'node:path'

const docsSiteRoot = process.cwd()
const docsRoot = path.resolve(docsSiteRoot, '../docs')
const vueRoot = path.resolve(docsSiteRoot, 'node_modules/vue')

export default defineConfig({
  title: 'PROJECT_NAME Docs',
  description: 'Project documentation',
  srcDir: docsRoot,
  srcExclude: ['**/_inventory.md'],
  vite: {
    server: {
      fs: { allow: [docsSiteRoot, docsRoot] },
    },
    resolve: {
      dedupe: ['vue'],
      alias: [
        {
          find: 'vue/server-renderer',
          replacement: path.join(vueRoot, 'server-renderer/index.mjs'),
        },
        { find: /^vue$/, replacement: path.join(vueRoot, 'dist/vue.runtime.esm-bundler.js') },
      ],
    },
  },
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Product', link: '/product/' },
      { text: 'Architecture', link: '/architecture/' },
      { text: 'Operations', link: '/operations/' },
      { text: 'Development', link: '/development/' },
    ],
    sidebar: {
      '/product/': [
        { text: 'Overview', link: '/product/overview' },
      ],
      '/architecture/': [
        { text: 'Overview', link: '/architecture/overview' },
      ],
      '/operations/': [
        { text: 'Overview', link: '/operations/overview' },
      ],
      '/development/': [
        { text: 'Ticket-driven setup', link: '/development/ticket-driven-setup' },
        { text: 'rulesync', link: '/development/rulesync' },
        { text: 'Stack paths', link: '/development/stack-paths' },
        { text: 'UI design workflow', link: '/development/ui-design-workflow' },
        { text: 'Testing strategy', link: '/development/testing-strategy' },
      ],
    },
  },
})
