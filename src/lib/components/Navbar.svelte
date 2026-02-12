<script>
    export let activeSection = "home";
</script>

<nav
    class="fixed top-0 w-full z-50 transition-all duration-300 backdrop-blur-md bg-white/10 border-b border-white/20"
>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <div class="flex-shrink-0">
                <span class="text-white font-bold text-xl tracking-wider"
                    >RiSE 2026</span
                >
            </div>
            <div class="hidden md:block">
                <div class="ml-10 flex items-baseline space-x-4">
                    <a
                        href="#home"
                        class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors"
                        >Home</a
                    >
                    <a
                        href="#about"
                        class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors"
                        >About</a
                    >
                    <a
                        href="#guests"
                        class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors"
                        >Guests</a
                    >
                    <a
                        href="#register"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full text-sm font-medium transition-colors shadow-lg shadow-blue-500/30"
                        >Register</a
                    >
                </div>
            </div>
        </div>
    </div>
</nav>
