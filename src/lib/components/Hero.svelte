<script>
    import Particles from "./Particles.svelte";
</script>

<section
    id="home"
    class="relative h-screen flex items-center justify-center overflow-hidden"
>
    <Particles />

    <div class="relative z-10 text-center px-4 sm:px-6 lg:px-8">
        <h1
            class="text-5xl md:text-7xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-blue-400 via-purple-500 to-pink-500 mb-6 drop-shadow-lg animate-fade-in-up"
        >
            RiSE Conclave 2026
        </h1>
        <p
            class="mt-4 text-xl md:text-2xl text-gray-200 max-w-3xl mx-auto font-light animate-fade-in-up delay-100"
        >
            Research, Industry, Startup and Entrepreneurship Conclave
        </p>

        <div
            class="mt-10 flex justify-center gap-4 animate-fade-in-up delay-200"
        >
            <a
                href="#about"
                class="px-8 py-3 rounded-full bg-white/10 backdrop-blur-sm border border-white/20 text-white hover:bg-white/20 transition-all transform hover:scale-105"
            >
                Learn More
            </a>
            <a
                href="#register"
                class="px-8 py-3 rounded-full bg-gradient-to-r from-blue-600 to-purple-600 text-white shadow-lg shadow-purple-500/30 hover:shadow-purple-500/50 transition-all transform hover:scale-105"
            >
                Join Now
            </a>
        </div>

        <!-- Logos Placeholder -->
        <div
            class="mt-16 flex justify-center items-center gap-8 opacity-80 grayscale hover:grayscale-0 transition-all duration-500"
        >
            <!-- Replace with actual logo logic/images -->
            <div
                class="h-12 w-32 bg-white/10 rounded flex items-center justify-center text-xs text-white/50"
            >
                CSIR-SERC
            </div>
            <div
                class="h-12 w-32 bg-white/10 rounded flex items-center justify-center text-xs text-white/50"
            >
                CSIR-CLRI
            </div>
            <div
                class="h-12 w-32 bg-white/10 rounded flex items-center justify-center text-xs text-white/50"
            >
                CSIR-CECRI
            </div>
        </div>
    </div>
</section>

<style>
    .animate-fade-in-up {
        animation: fadeInUp 0.8s ease-out forwards;
        opacity: 0;
        transform: translateY(20px);
    }
    .delay-100 {
        animation-delay: 0.2s;
    }
    .delay-200 {
        animation-delay: 0.4s;
    }

    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
