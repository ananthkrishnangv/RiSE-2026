import adapter from '@sveltejs/adapter-auto';
import nodeAdapter from '@sveltejs/adapter-node';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: vitePreprocess(),
	kit: {
		adapter: process.env.ADAPTER === 'node'
			? nodeAdapter()
			: adapter(),
		files: {
			assets: 'static'
		}
	}
};

export default config;
