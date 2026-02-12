<script>
    import { enhance } from "$app/forms";
    export let images = [];

    let isUploading = false;
</script>

<section
    id="portal"
    class="py-20 bg-slate-900 border-t border-slate-800 text-white"
>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2
                class="text-3xl md:text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-green-400 to-emerald-600"
            >
                Innovation Portal
            </h2>
            <p class="mt-4 text-gray-400">
                Share your innovation highlights with the community.
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <!-- Upload Form -->
            <div class="bg-slate-800/50 p-8 rounded-2xl border border-gray-700">
                <h3 class="text-xl font-semibold mb-6">Upload Highlights</h3>
                <form
                    action="?/upload"
                    method="POST"
                    enctype="multipart/form-data"
                    use:enhance={() => {
                        isUploading = true;
                        return async ({ update }) => {
                            await update();
                            isUploading = false;
                        };
                    }}
                    class="space-y-4"
                >
                    <div
                        class="relative border-2 border-dashed border-gray-600 rounded-lg p-6 text-center hover:border-blue-500 transition-colors"
                    >
                        <input
                            type="file"
                            name="image"
                            accept="image/*"
                            class="absolute inset-0 w-full h-full opacity-0 cursor-pointer"
                            required
                        />
                        <div class="text-gray-400">
                            <svg
                                class="w-12 h-12 mx-auto mb-2"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                ><path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
                                ></path></svg
                            >
                            <p>Click to upload or drag and drop</p>
                        </div>
                    </div>
                    <button
                        type="submit"
                        disabled={isUploading}
                        class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 rounded-lg transition-colors disabled:opacity-50"
                    >
                        {isUploading ? "Uploading..." : "Upload to Gallery"}
                    </button>
                </form>
            </div>

            <!-- Registration Form -->
            <div class="bg-slate-800/50 p-8 rounded-2xl border border-gray-700">
                <h3 class="text-xl font-semibold mb-6">Register Interest</h3>
                <form
                    action="?/register"
                    method="POST"
                    use:enhance
                    class="space-y-4"
                >
                    <div>
                        <label
                            class="block text-sm font-medium text-gray-400 mb-1"
                            >Name</label
                        >
                        <input
                            type="text"
                            name="name"
                            class="w-full bg-slate-900 border border-gray-600 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none"
                            required
                            placeholder="Dr. John Doe"
                        />
                    </div>
                    <div>
                        <label
                            class="block text-sm font-medium text-gray-400 mb-1"
                            >Email</label
                        >
                        <input
                            type="email"
                            name="email"
                            class="w-full bg-slate-900 border border-gray-600 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none"
                            required
                            placeholder="john@example.com"
                        />
                    </div>
                    <div>
                        <label
                            class="block text-sm font-medium text-gray-400 mb-1"
                            >Organization</label
                        >
                        <input
                            type="text"
                            name="organization"
                            class="w-full bg-slate-900 border border-gray-600 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none"
                            placeholder="CSIR"
                        />
                    </div>
                    <button
                        type="submit"
                        class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-lg transition-colors"
                    >
                        Register
                    </button>
                </form>
            </div>
        </div>

        <!-- Gallery -->
        <div class="mt-16">
            <h3 class="text-2xl font-semibold mb-8 text-center">
                Community Highlights
            </h3>
            {#if images.length === 0}
                <p class="text-center text-gray-500 italic">
                    No uploads yet. Be the first!
                </p>
            {:else}
                <div
                    class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4"
                >
                    {#each images as img}
                        <div
                            class="relative group aspect-square bg-slate-800 rounded-lg overflow-hidden border border-gray-700"
                        >
                            <img
                                src={img.data}
                                alt={img.name}
                                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                                loading="lazy"
                            />
                            <div
                                class="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center"
                            >
                                <span
                                    class="text-xs text-white px-2 text-center"
                                    >{img.name}</span
                                >
                            </div>
                        </div>
                    {/each}
                </div>
            {/if}
        </div>
    </div>
</section>
