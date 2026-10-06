# [NOMBRE DEL PROYECTO]

## Descripción
[Qué hace este proyecto, para quién, y cuál es su propósito principal.]

## Stack
<!-- Descomenta lo que uses y elimina el resto -->

### Backend
- [ ] Python 3.x / Flask
- [ ] Node.js / Express
- [ ] ORM: SQLAlchemy / Sequelize / Prisma
- [ ] Auth: JWT / Sessions

### Base de datos
- [ ] PostgreSQL
- [ ] MySQL

### Frontend (si aplica)
- [ ] React
- [ ] HTML/CSS/JS vanilla

## Comandos clave

### Python / Flask
```bash
# Activar entorno virtual
source venv/bin/activate        # Linux/Mac
venv\Scripts\activate           # Windows

# Instalar dependencias
pip install -r requirements.txt

# Correr en desarrollo
flask run --debug

# Migraciones
flask db migrate -m "descripcion"
flask db upgrade
flask db downgrade

# Tests
pytest tests/ -v
pytest tests/ -v --cov=src
```

### Node.js / Express
```bash
# Instalar dependencias
npm install

# Correr en desarrollo
npm run dev

# Tests
npm test

# Migraciones (si usas Sequelize)
npx sequelize-cli db:migrate
npx sequelize-cli db:migrate:undo
```

## Estructura del proyecto
```
src/
  api/          ← rutas y controladores
  models/       ← modelos de base de datos
  services/     ← lógica de negocio
  utils/        ← helpers y utilidades
tests/
  unit/
  integration/
docs/
  architecture.md
  decisions/
```

## Convenciones de código

### Nombres
- Variables y funciones: `snake_case` (Python) / `camelCase` (JS)
- Clases: `PascalCase`
- Constantes: `UPPER_SNAKE_CASE`
- Rutas API: `/kebab-case`
- Archivos: `snake_case.py` / `camelCase.js`

### Commits (Conventional Commits)
```
feat(scope): descripción corta
fix(scope): descripción corta
refactor(scope): descripción corta
test(scope): descripción corta
docs(scope): descripción corta
```
Ejemplos:
- `feat(auth): agregar endpoint de login con JWT`
- `fix(invoices): corregir cálculo de impuestos`

### Ramas
- `main` → producción
- `develop` → integración
- `feature/nombre-descriptivo`
- `fix/nombre-del-bug`

## Reglas importantes
1. No hardcodear credenciales — usar variables de entorno (.env)
2. Toda ruta nueva requiere su test correspondiente
3. Documentar decisiones de arquitectura en docs/decisions/
4. Revisar con el skill `code-review` antes de hacer merge
5. Los endpoints siguen el patrón: modelo → servicio → ruta → test

## Variables de entorno necesarias
```env
# Base de datos
DB_HOST=localhost
DB_PORT=5432          # PostgreSQL | 3306 MySQL
DB_NAME=nombre_db
DB_USER=usuario
DB_PASSWORD=password

# App
SECRET_KEY=clave_secreta
DEBUG=True
PORT=5000

# JWT (si aplica)
JWT_SECRET=jwt_secret
JWT_EXPIRATION=3600
```

## Contexto adicional
- [docs/architecture.md](docs/architecture.md)
- [Link al repositorio]
- [Cualquier nota importante del dominio del negocio]

## Frontend Standards

### Filosofía
Cada UI debe ser production-grade: accesible, performante, mantenible y visualmente
intencional. El código debe poder pasar un code review en un equipo senior.

---

### Arquitectura de Componentes
- **Separación de responsabilidades**: lógica de negocio fuera del componente UI
  - Angular: Services + Smart/Dumb component pattern
  - React: Custom hooks para lógica, componentes solo para renderizado
- **Componentes pequeños y enfocados**: max ~150 líneas, una sola responsabilidad
- **Props/Inputs tipados siempre**: TypeScript strict, sin `any`
- **Composición sobre herencia**: preferir composition pattern
- Estructura de carpeta por feature, no por tipo:
```
  feature/
  ├── components/     ← UI puro, sin lógica de negocio
  ├── services/       ← lógica, llamadas HTTP
  ├── models/         ← interfaces y tipos
  ├── hooks/ o store/ ← estado local/global
  └── index.ts        ← barrel export
```

---

### TypeScript
- `strict: true` siempre en tsconfig
- Interfaces para objetos de dominio, types para uniones/utilidades
- Sin `any` — usar `unknown` + type guards si es necesario
- Tipar explícitamente returns de funciones y métodos públicos
- Enums solo cuando los valores tienen significado semántico real

---

### Estilos y CSS
- **Design tokens primero**: definir variables antes de escribir una línea de estilo
```css
  :root {
    /* Spacing scale (base 4px) */
    --space-1: 0.25rem;  --space-2: 0.5rem;
    --space-4: 1rem;     --space-8: 2rem;
    /* Type scale */
    --text-sm: clamp(0.8rem, 1.5vw, 0.875rem);
    --text-base: clamp(0.9rem, 2vw, 1rem);
    --text-lg: clamp(1rem, 2.5vw, 1.25rem);
    --text-xl: clamp(1.2rem, 3vw, 1.75rem);
    --text-2xl: clamp(1.5rem, 4vw, 2.5rem);
    /* Colors */
    --color-primary: ...;
    --color-primary-hover: ...;
    --color-surface: ...;
    --color-surface-raised: ...;
    --color-text: ...;
    --color-text-muted: ...;
    --color-border: ...;
    /* Radii */
    --radius-sm: 4px; --radius-md: 8px; --radius-lg: 16px;
    /* Shadows */
    --shadow-sm: 0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06);
    --shadow-md: 0 4px 12px rgba(0,0,0,0.1), 0 2px 4px rgba(0,0,0,0.06);
    --shadow-lg: 0 20px 40px rgba(0,0,0,0.15);
  }
```
- Metodología **BEM** para CSS vanilla/SCSS, o **CSS Modules** para React
- En Angular: usar `::ng-deep` solo como último recurso, preferir encapsulación
- **Fluid layout**: CSS Grid para estructura, Flexbox para alineación lineal
- Mobile-first: estilos base para móvil, `@media (min-width: ...)` para crecer
- `clamp()` para todo lo que necesite escalar: font-size, padding, gap

---

### Accesibilidad (a11y) — No negociable
- Todo elemento interactivo debe ser alcanzable con `Tab` y operable con `Enter/Space`
- Imágenes con `alt` descriptivo o `alt=""` si son decorativas
- Formularios: `<label>` asociado a cada input (no solo placeholder)
- Contraste mínimo WCAG AA: 4.5:1 texto normal, 3:1 texto grande
- Roles ARIA solo cuando HTML semántico no alcanza (`<button>`, `<nav>`, `<main>`)
- `focus-visible` estilizado — nunca `outline: none` sin reemplazo
- Reducir movimiento si el usuario lo prefiere:
```css
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after { animation-duration: 0.01ms !important; }
  }
```

---

### Performance — Core Web Vitals
- **LCP < 2.5s**: imágenes above-the-fold con `loading="eager"`, resto `loading="lazy"`
- **CLS = 0**: reservar espacio para imágenes y elementos async con dimensiones explícitas
- **INP < 200ms**: evitar trabajo pesado en el hilo principal, usar `OnPush` en Angular
- Lazy loading de rutas/módulos (Angular: `loadComponent`, React: `React.lazy`)
- Bundle splitting por feature — no importar módulos enteros si solo se usa una parte
- Imágenes: usar formatos modernos (WebP/AVIF), dimensiones correctas, no escalar con CSS
- Fuentes: `font-display: swap`, preload de fuentes críticas

---

### Estado
- **Local first**: `signal`/`useState` para estado que no necesita compartirse
- **State lifting** cuando 2+ componentes comparten estado
- **Global store** solo cuando el estado cruza features sin relación directa
  - Angular: Services con `signal()` o NgRx para apps complejas
  - React: Zustand (simple) o Redux Toolkit (complejo)
- Nunca mutar estado directamente — siempre inmutabilidad

---

### Formularios
- Angular: Reactive Forms siempre (no Template-driven en formularios reales)
- Validación en el modelo, no en el template
- Mensajes de error accesibles: `aria-describedby` apuntando al mensaje de error
- Estados visuales claros: default → focus → valid → error → disabled

---

### Animaciones
- Preferir CSS transitions para estado simple (hover, focus, open/close)
- JS animations (Angular Animations / Framer Motion) solo para secuencias complejas
- Propiedades seguras para animar (no causan reflow): `transform`, `opacity`, `filter`
- NUNCA animar `width`, `height`, `top`, `left` — usar `transform: scale/translate`
- Duración: 150-200ms para micro-interacciones, 300-400ms para transiciones de vista

---

### Calidad de código
- ESLint + Prettier configurados y sin warnings en CI
- Nombres en inglés: componentes, variables, funciones, archivos
- Comentarios solo para el **por qué**, nunca para el **qué** (el código lo dice)
- Sin `console.log` en código que va a producción
- Todo componente nuevo requiere al menos un test de renderizado base

---

### Toolchain mínimo profesional
| Herramienta | Propósito |
|---|---|
| TypeScript strict | Tipado |
| ESLint + angular-eslint / eslint-react | Linting |
| Prettier | Formateo consistente |
| Husky + lint-staged | Pre-commit hooks |
| Vitest / Jest | Unit tests |
| Playwright / Cypress | E2E tests |
| Storybook (opcional) | Documentar componentes |