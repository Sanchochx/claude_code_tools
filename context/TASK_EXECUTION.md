# 📋 FLUJO DE EJECUCIÓN DE TAREAS

<!--
  Manual de instrucciones para la IA. Generalmente NO necesitas modificarlo entre proyectos.
  Personaliza: "Archivos de Contexto" y "Referencia Rápida".
-->

**Versión:** 1.1
**Última actualización:** [YYYY-MM-DD]

---

## 📁 Archivos de Contexto

Antes de comenzar cualquier tarea, revisar estos archivos:

- **`@context/IMPLEMENTATION_PLAN.md`** — Plan maestro con historias de usuario (US) y progreso por fases
- **`@CLAUDE.md`** — Detalles del proyecto, stack tecnológico y estándares de código

> En todo este documento, "el plan" = `@context/IMPLEMENTATION_PLAN.md`.

<!--
  Agrega aquí otros archivos de contexto del proyecto (ARCHITECTURE.md, API_SPEC.md, DB_SCHEMA.md, etc.)
-->

---

## 🔄 Proceso de Ejecución

### 1. Encontrar la siguiente US

- Si hay una US marcada `[~]` en el plan, **retómala primero**.
- Si no hay ninguna, toma la **primera US `[ ]`** del plan y márcala `[~]` antes de empezar (solo UNA `[~]` a la vez).
- Lee el archivo completo de la US: TODOS los criterios de aceptación y el campo **Dependencias** (si existe).
- Si una dependencia no está `[x]`, avisa al usuario antes de continuar.

```markdown
[~] US-[PREFIJO]-001: [Nombre de la Historia]
```

---

### 2. Implementar cada criterio de aceptación

**Regla de oro:** trabaja los criterios **UNO A LA VEZ**.

Para cada criterio:

1. **Explica qué vas a construir y por qué** (objetivo y relación con la arquitectura).
2. **Crea/modifica archivos** en los directorios definidos en `CLAUDE.md`, respetando la estructura existente.
3. **Aplica estándares y convenciones** de `CLAUDE.md`, manteniendo consistencia con el código existente.
4. **Actualiza la documentación afectada** (forma parte del alcance de la US).
5. **Marca el criterio `[x]`** en el archivo de la US al terminar.

```markdown
## Criterios de Aceptación

- [x] [Criterio completado]
- [ ] [Criterio pendiente]
```

---

### 3. Cerrar la US

Cuando TODOS los criterios estén `[x]`:

1. Recorre el **Checklist de Verificación** (al final de este documento).
2. En el plan: marca la US `[x]` (reemplaza `[~]`).
3. Actualiza el dashboard (contadores) y las barras de progreso de **épica** y **fase**.

```markdown
[x] US-[PREFIJO]-001: [Nombre de la Historia]
```

---

### 4. Checkpoint (obligatorio)

Muestra un resumen y **detente a esperar confirmación**:

```
✅ US-[PREFIJO]-001 Completada

Archivos creados/modificados:
- [ruta/archivo] - [propósito]

Funcionalidades:
- [Funcionalidad implementada]

Decisiones técnicas:
- [Decisión y motivo]

¿Proceder con US-[PREFIJO]-002?
```

- No avances a la siguiente US sin aprobación explícita del usuario.
- No hagas nada fuera de este flujo mientras esperas.

---

### 5. Resumen de fase (solo si corresponde)

**Cuándo:** al completar TODAS las US de una **fase** (después del checkpoint de la última US).

**Dónde y nombre:** `context/summaries/phase-[N]-resume.md`

**Contenido:**

- **📝 Changes Made:** módulos, funcionalidades core e integraciones de la fase.
- **📂 Files Modified/Created:** ruta, propósito y cambios principales de cada archivo.
- **🎯 Rationale:** qué se completó y por qué, cómo encaja en la arquitectura, decisiones de diseño y patrones usados.
- **🚀 Next Steps:** fase siguiente, dependencias y consideraciones.

**Propósito:** que futuras sesiones de LLM entiendan el estado del proyecto sin releer todo el código.

---

## ⚠️ Guías Importantes

- **Arquitectura:** sigue `CLAUDE.md` (arquitectura, estándares, organización de archivos, nombres).
- **Trabajo incremental:** un criterio a la vez; una US a la vez.
- **Commits:** no hagas commits a menos que el usuario lo pida. Si lo pide, que sean pequeños y atómicos (uno por criterio).
- **Testing:** solo implementación. No escribas tests salvo que la US los exija en sus criterios.
- **Dudas:** si un criterio es ambiguo o choca con la arquitectura existente, pregunta antes de implementar.
- **Alcance:** no modifiques archivos fuera del alcance de la US actual.

---

## 🎯 Buenas Prácticas

### ✅ HACER
- Leer toda la US antes de comenzar
- Seguir el orden del plan
- Marcar el progreso en tiempo real
- Explicar decisiones técnicas

### ❌ NO HACER
- Saltarte US
- Trabajar en varias US a la vez
- Asumir implementaciones sin revisar criterios
- Avanzar sin autorización del usuario

---

## 🔍 Checklist de Verificación

Antes de marcar una US como completa:

- [ ] Todos los criterios de aceptación están `[x]`
- [ ] Los archivos están en los directorios correctos
- [ ] El código sigue los estándares de `CLAUDE.md`
- [ ] La documentación está actualizada
- [ ] No hay código comentado sin razón
- [ ] Las funcionalidades cumplen los criterios

---

## 📌 Referencia Rápida

| Archivo | Propósito |
|---------|-----------|
| `@context/IMPLEMENTATION_PLAN.md` | Plan maestro con todas las US y progreso |
| `@CLAUDE.md` | Detalles técnicos y estándares del proyecto |
| `context/user_stories/` | Archivos individuales de historias de usuario |
| `context/summaries/` | Resúmenes de fase |
| `[ARCHIVO_CUSTOM_1]` | [Propósito — reemplaza o elimina esta fila] |

---

**Importante:** flujo diseñado para trabajo incremental y colaborativo. Siempre espera confirmación del usuario antes de pasar a la siguiente US.