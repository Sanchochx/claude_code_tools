# 🚀 [NOMBRE_PROYECTO] - Plan de Implementación

<!--
  INSTRUCCIONES DE USO
  1. Reemplaza [NOMBRE_PROYECTO] con el nombre real
  2. Define tus épicas en la tabla "Progreso por Épica"
  3. Crea tus fases y agrega las historias de usuario (US)
  4. Usa los prefijos de ID sugeridos o define los tuyos
  5. El workflow (TASK_EXECUTION.md) actualiza este archivo al cerrar cada US

  Estados de US (el checkbox del título es la ÚNICA fuente de verdad):
    [ ]  Pendiente
    [~]  En progreso (solo UNA a la vez)
    [x]  Completada
-->

**Última actualización:** [YYYY-MM-DD]
**Versión:** 1.1

---

## 📊 Dashboard General

```
┌─────────────────────────────────────────────────────────────┐
│  PROGRESO GLOBAL DEL PROYECTO                               │
├─────────────────────────────────────────────────────────────┤
│  Total Historias de Usuario:     0                          │
│  ✅ Completadas:                 0                          │
│  ⏳ En Progreso:                 0                          │
│  ⏸️  Pendientes:                 0                          │
│                                                             │
│  Progreso: [░░░░░░░░░░] 0% (0/0)                            │
└─────────────────────────────────────────────────────────────┘
```

<!--
  Barra de progreso de referencia (10 caracteres):
  0%   → [░░░░░░░░░░]    50%  → [█████░░░░░]
  10%  → [█░░░░░░░░░]    60%  → [██████░░░░]
  20%  → [██░░░░░░░░]    70%  → [███████░░░]
  30%  → [███░░░░░░░]    80%  → [████████░░]
  40%  → [████░░░░░░]    90%  → [█████████░]
                          100% → [██████████]
-->

---

## 🎯 Progreso por Épica

<!--
  Una fila por épica. Esta tabla es el ÚNICO lugar con el progreso por épica.
  Prefijos de ID sugeridos (personaliza según tu dominio):
    AUTH  → Autenticación / usuarios
    PROD  → Productos / catálogo
    ORD   → Órdenes / ventas
    INV   → Inventario / stock
    SUP   → Proveedores / supply chain
    REP   → Reportes / analytics
    CFG   → Configuración / settings
    NOTIF → Notificaciones
  Ejemplo: US-AUTH-001, US-PROD-003, US-ORD-010
-->

| Epic | Nombre | Total US | Completadas | En Progreso | Pendientes | Progreso |
|------|--------|----------|-------------|-------------|------------|----------|
| 01 | [NOMBRE_EPICA_01] | 0 | 0 | 0 | 0 | [░░░░░░░░░░] 0% |
| 02 | [NOMBRE_EPICA_02] | 0 | 0 | 0 | 0 | [░░░░░░░░░░] 0% |
| 03 | [NOMBRE_EPICA_03] | 0 | 0 | 0 | 0 | [░░░░░░░░░░] 0% |

---

## 📅 Plan de Implementación por Fases

---

# 🎯 FASE 1: [NOMBRE_FASE_1] (Sprint 1-2)

<!-- Ejemplos de nombre de fase: FUNDACIÓN, CORE, MVP, LANZAMIENTO. Ajusta los sprints a tu planificación. -->

**Objetivo:** [Objetivo principal de la fase en una oración]
**Épicas:** [Épicas que cubre, ej: 01 Foundation, 02 Core Data]
**Total US:** [N]
**Progreso:** [░░░░░░░░░░] 0% (0/[N])

---

## Epic [NN]: [NOMBRE_EPICA] - [DESCRIPCIÓN_BREVE]

**Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
**Carpeta:** `context/user_stories/epic_[NN]_[nombre_slug]/`

### Historias de Usuario

<!--
  Formato de ID: US-[PREFIJO]-[NNN]  (ej: US-AUTH-001)
  Prioridades válidas: CRÍTICA / ALTA / MEDIA / BAJA
  Estimación en puntos (Fibonacci sugerido: 1, 2, 3, 5, 8, 13)
  Dependencias: IDs de US que deben estar [x] antes, o "Ninguna"
-->

#### [ ] US-[PREFIJO]-001: [Nombre de la Historia]
- **Archivo:** `context/user_stories/epic_[NN]_[slug]/US-[PREFIJO]-001_[nombre_archivo].md`
- **Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
- **Estimación:** [N] pts
- **Dependencias:** [Ninguna / US-XXX-NNN]
- **Criterios de Aceptación:** [N]

#### [ ] US-[PREFIJO]-002: [Nombre de la Historia]
- **Archivo:** `context/user_stories/epic_[NN]_[slug]/US-[PREFIJO]-002_[nombre_archivo].md`
- **Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
- **Estimación:** [N] pts
- **Dependencias:** [Ninguna / US-XXX-NNN]
- **Criterios de Aceptación:** [N]

<!-- Duplica el bloque anterior para cada US de esta épica -->

---

## Epic [NN]: [NOMBRE_EPICA_2] - [DESCRIPCIÓN_BREVE]

**Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
**Carpeta:** `context/user_stories/epic_[NN]_[nombre_slug]/`

### Historias de Usuario

#### [ ] US-[PREFIJO]-001: [Nombre de la Historia]
- **Archivo:** `context/user_stories/epic_[NN]_[slug]/US-[PREFIJO]-001_[nombre_archivo].md`
- **Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
- **Estimación:** [N] pts
- **Dependencias:** [Ninguna / US-XXX-NNN]
- **Criterios de Aceptación:** [N]

---

# 🎯 FASE 2: [NOMBRE_FASE_2] (Sprint 3-4)

**Objetivo:** [Objetivo principal de la fase]
**Épicas:** [Épicas que cubre]
**Total US:** [N]
**Progreso:** [░░░░░░░░░░] 0% (0/[N])

---

## Epic [NN]: [NOMBRE_EPICA] - [DESCRIPCIÓN_BREVE]

**Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
**Carpeta:** `context/user_stories/epic_[NN]_[nombre_slug]/`

### Historias de Usuario

#### [ ] US-[PREFIJO]-001: [Nombre de la Historia]
- **Archivo:** `context/user_stories/epic_[NN]_[slug]/US-[PREFIJO]-001_[nombre_archivo].md`
- **Prioridad:** [CRÍTICA / ALTA / MEDIA / BAJA]
- **Estimación:** [N] pts
- **Dependencias:** [Ninguna / US-XXX-NNN]
- **Criterios de Aceptación:** [N]

<!-- Agrega las fases que necesites duplicando el bloque de FASE -->

---

## 📝 Notas de Implementación

### Cómo usar este plan

1. **Seguir el orden de las fases** — empezar siempre por la Fase 1
2. **Trabajo incremental** — completar una US antes de avanzar
3. **Marcar progreso** con el checkbox del título: `[ ]` pendiente, `[~]` en progreso (solo UNA), `[x]` completada
4. **Actualizar métricas** — al cerrar cada US: dashboard, fila de la épica en la tabla, barra de la fase y "Última actualización"
5. **Leer el archivo de cada US** — contiene los criterios de aceptación detallados

### Referencias del proyecto

- **Historias de usuario:** `context/user_stories/`
- **Workflow de ejecución:** `@context/TASK_EXECUTION.md`
- **Resúmenes de fase:** `context/summaries/`
- **Detalles técnicos:** `@CLAUDE.md`