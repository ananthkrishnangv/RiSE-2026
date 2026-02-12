import db from '$lib/server/db';

export const load = async () => {
    const images = db.prepare('SELECT * FROM images ORDER BY created_at DESC').all();
    return {
        images
    };
};

export const actions = {
    upload: async ({ request }) => {
        const data = await request.formData();
        const file = data.get('image');

        if (!file || file.size === 0) {
            return { success: false, message: 'No file uploaded' };
        }

        const buffer = await file.arrayBuffer();
        const base64 = Buffer.from(buffer).toString('base64');
        const mimeType = file.type;
        const name = file.name;
        const dataUri = `data:${mimeType};base64,${base64}`;

        const stmt = db.prepare('INSERT INTO images (name, data, mimeType) VALUES (?, ?, ?)');
        stmt.run(name, dataUri, mimeType);

        return { success: true };
    },
    register: async ({ request }) => {
        const data = await request.formData();
        const name = data.get('name');
        const email = data.get('email');
        const organization = data.get('organization');

        if (!name || !email) {
            return { success: false, message: 'Missing fields' };
        }

        const stmt = db.prepare('INSERT INTO registrations (name, email, organization) VALUES (?, ?, ?)');
        stmt.run(name, email, organization);

        return { success: true, message: 'Registered successfully!' };
    }
};
