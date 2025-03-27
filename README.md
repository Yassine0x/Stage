# Projet E-Commerce Full-Stack

## 📝 Description

Plateforme e-commerce développée avec Laravel (back-end) et React (front-end), offrant une expérience d'achat en ligne performante et sécurisée.

## 🚀 Technologies Principales

- **Back-end:** Laravel (PHP)
- **Front-end:** React
- **Paiement:** Stripe
- **Base de données:** MySQL

## ✨ Fonctionnalités

- Catalogue de produits dynamique
- Système d'authentification utilisateur
- Processus de paiement sécurisé
- Gestion complète des commandes
- Interface utilisateur responsive

## 🔧 Prérequis

- PHP 8.1+
- Composer
- Node.js 16+
- Compte Stripe

## 📦 Installation

### Clonage du Projet

```bash
git clone https://github.com/Yassine0x/Stage.git
cd stage
```

### Configuration Backend

```bash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
```

### Configuration Frontend

```bash
cd frontend
npm install
```

## 🖥️ Démarrage du Projet

### Serveur Backend

```bash
php artisan serve
```

### Serveur Frontend

```bash
npm start
```

## 🗂️ Structure du Projet

```
ecommerce-project/
│
├── backend/             # Laravel Backend
│   ├── app/
│   ├── database/
│   └── routes/
│
└── frontend/            # React Frontend
    ├── src/
    │   ├── components/
    │   ├── pages/
    │   └── services/
    └── public/
```

## 🔒 Sécurité

- Authentification JWT
- Validation côté serveur
- Intégration Stripe sécurisée
- Protection contre les failles CSRF et XSS

