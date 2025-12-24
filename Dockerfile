# Utiliser l'image Node.js officielle
FROM node:20-slim

# Installer les dépendances système nécessaires pour Puppeteer et node-gyp
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    python3 \
    python3-pip \
    build-essential \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/bin/python3 /usr/bin/python

# Configurer les variables d'environnement pour Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Créer le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install --production

# Copier le reste du code source
COPY . .

# Exposer le port si nécessaire (optionnel pour un bot Discord)
# EXPOSE 3000

# Démarrer l'application
CMD ["node", "index.js"]
