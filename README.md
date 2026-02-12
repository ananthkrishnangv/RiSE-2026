# RiSE Conclave 2026 Portal

![RiSE Conclave 2026 Landing Page](rise_conclave_portal_screenshot_1770908949466.png)

A stunning, modern single-page portal for the **Research, Industry, Startup and Entrepreneurship (RiSE) Conclave 2026**. This application serves as the main landing page for the event, featuring an immersive UI, event details, multimedia integration, and an innovative "Innovation Portal" for community engagement.

## Features

### 🎨 Advanced UI & UX
- **Next-Gen Aesthetics**: Built with **TailwindCSS** featuring deep "Glassmorphism" effects, acrylic textures, and vibrant gradients.
- **Particle Effects**: Interactive background particles powered by `tsparticles` for a premium, dynamic feel.
- **Responsive Design**: Fully mobile-responsive layout with smooth transitions and animations.

### ⚡ Technical Stack
- **Framework**: [SvelteKit](https://kit.svelte.dev/) for high-performance rendering.
- **Styling**: TailwindCSS with custom configuration.
- **Backend/Database**: **SQLite** (via `better-sqlite3`) for a self-contained, portable database handling image uploads and registrations.
- **Containerization**: Dockerized with a multi-stage build process optimized for Node.js and Podman.

### 🚀 Innovation Portal
The "Portal" section demonstrates full-stack capabilities:
- **Image Gallery**: Users can upload innovation highlights. Images are stored directly in the SQLite database as Base64/BLOBs (for portability in this demo).
- **Registration**: A functional interest registration form.

## Deployment

The application is containerized and designed to be deployed on **Podman** or Docker.

### Prerequisites
- Node.js 20+ (for local dev)
- Podman or Docker (for production)

### Local Development
```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

### Production Deployment (Podman)
The project includes a `deploy.sh` script for automated deployment to a remote host.

1.  **Configure Host**: Update `deploy.sh` with your target host IP and user.
2.  **Deploy**:
    ```bash
    ./deploy.sh
    ```

**Default Configuration:**
-   **Port**: 3000
-   **Database volume**: `/data` (persisted on host)

## Project Structure
-   `src/routes`: Main pages and server-side logic (`+page.server.js`).
-   `src/lib/components`: Reusable UI components (Hero, Navbar, Particles, etc.).
-   `src/lib/server`: Database initialization and connection logic.
-   `Dockerfile`: Multi-stage build definition.

## License
MIT
