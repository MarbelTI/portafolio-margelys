# Portafolio — Margelys Santos

Sitio estático (sin build step). Datos de proyectos en Supabase. Imágenes como archivos estáticos en `assets/img/`.

## 1. Supabase

1. Entra a tu proyecto: https://supabase.com/dashboard/project/sofglcbczujatnxnksaw
2. SQL Editor → New query → pega el contenido de `supabase/schema.sql` → Run
   (crea la tabla `projects` con los 6 casos reales ya cargados, apuntando a `assets/img/...`)
3. Project Settings → API → copia `Project URL` y la `anon public` key (NO la `service_role`)
4. Pega ambos en `assets/config.js`
5. Authentication → Users → Add user → tu login para `/admin` (deja "Auto Confirm User" activado)

## 2. GitHub

```
cd portafolio-margelys
git init
git add .
git commit -m "portafolio: home, detalle de proyecto, admin, 6 casos reales"
git branch -M main
git remote add origin https://github.com/MarbelTI/portafolio-margelys.git
git push -u origin main
```

## 3. Vercel

1. https://vercel.com/nuevaacropolis → Add New → Project
2. Importa `MarbelTI/portafolio-margelys`
3. Framework Preset: **Other** (sin build) — Build Command y Output Directory vacíos
4. Deploy

## 4. Contacto — revisa antes de publicar

Puse tu email y WhatsApp reales (del CV) en la sección de contacto de `index.html`:
`Margelys.invermapa@gmail.com` y `wa.me/584262249525`. Si no quieres publicarlos así, dime y los cambio por un
formulario o los quito.

## 5. Habilidades — cómo crece solo

El gráfico de burbujas lee los `tags` de todos los proyectos en Supabase y arma la burbuja automáticamente:
tag nuevo que no está en la taxonomía → se agrega como burbuja de primer nivel (color periwinkle por defecto).
Si quieres que un tag nuevo sea "hijo" de otro (ej. una herramienta específica dentro de Power Query) o cambiarle
el color de familia, se edita el objeto `SKILL_FAMILY` / `SKILL_PARENT` al inicio de `assets/app.js` — dos líneas,
no hay que tocar nada más.

## 6. Agregar proyectos nuevos

Desde `/admin` (sin enlace visible — el puntito casi invisible junto a los tabs del footer, o escribiendo la URL
directamente). Si el proyecto tiene captura: primero súbela a `assets/img/` en el repo (vía GitHub web o git push),
luego en el formulario de `/admin` escribe esa ruta en "Ruta o URL de la imagen".
