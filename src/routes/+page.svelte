<script>
    import Navbar from "$lib/components/Navbar.svelte";
    import Hero from "$lib/components/Hero.svelte";
    import About from "$lib/components/About.svelte";
    import VideoSection from "$lib/components/VideoSection.svelte";
    import Guests from "$lib/components/Guests.svelte";
    import PortalHost from "$lib/components/PortalHost.svelte";

    export let data;
</script>

<div
    class="bg-slate-900 min-h-screen text-white selection:bg-purple-500 selection:text-white"
>
    <Navbar />

    <main>
        <Hero />
        <About />
        <VideoSection />
        <Guests />
        <PortalHost images={data.images} />
    </main>

    <footer
        class="bg-black py-8 text-center text-gray-600 text-sm border-t border-gray-900"
    >
        <p>&copy; 2026 RiSE Conclave. All rights reserved.</p>
    </footer>
</div>
