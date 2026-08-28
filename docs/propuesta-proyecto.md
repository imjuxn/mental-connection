# Trabajo Final Integrador

## Primera Entrega: Propuesta de Proyecto y Repositorio

**Proyecto:** Mental Connection  
**Integrantes:**  
- Juan José Silva
- Luca Arlettaz

**Tutor:** Sebastián Bruselario  
**Fecha de entrega:** 30 de agosto de 2026  
**Repositorio:** https://github.com/imjuxn/mental-connection

---

## 1. Título del proyecto y datos generales

**Nombre del proyecto:** Mental Connection

**Subtítulo:** Plataforma web para la gestión administrativa de turnos en servicios de salud mental

**Tipo de proyecto:** Desarrollo de software web

**Descripción breve:**

Mental Connection es una plataforma web orientada a la gestión de turnos y organización administrativa para profesionales vinculados a la salud mental y disciplinas afines.

El sistema permitirá administrar pacientes, profesionales, especialidades, disponibilidad horaria, turnos y pagos o señas asociados a las reservas desde una misma plataforma.

La aplicación estará pensada para incluir distintas áreas relacionadas con la salud mental, como psicología, psiquiatría, psicopedagogía, fonoaudiología y otras disciplinas afines.

---

## 2. Descripción del problema

Actualmente, muchos profesionales y centros vinculados a la salud mental gestionan sus turnos mediante agendas físicas, planillas, llamadas o mensajes de WhatsApp.

Esta forma de organización puede generar superposición de horarios, pérdida de información, demoras en la confirmación de turnos y dificultades para llevar un control administrativo ordenado.

Además, los pacientes muchas veces no cuentan con un espacio claro donde consultar sus turnos, verificar horarios asignados o solicitar una nueva reserva.

También puede resultar complejo administrar pagos o señas de turnos cuando estas operaciones se realizan por fuera del sistema, sin una integración clara entre la reserva y el estado del pago.

---

## 3. Solución propuesta

Se propone desarrollar Mental Connection, una plataforma web que centralice la gestión de turnos, pacientes, profesionales, especialidades, disponibilidad horaria y pagos asociados a reservas en el ámbito de la salud mental.

El sistema permitirá que los pacientes puedan registrarse, consultar disponibilidad, solicitar turnos y visualizar sus reservas dentro del sistema.

Los profesionales podrán administrar su perfil, especialidad, modalidad de atención, disponibilidad horaria, agenda y turnos asignados.

Además, existirá un rol administrador encargado de gestionar usuarios, profesionales, especialidades y datos generales del sistema.

Como integración con una API de terceros, el sistema incorporará Mercado Pago API para permitir la gestión de pagos o señas de turnos dentro de la plataforma.

---

## 4. Usuarios del sistema

El sistema contará con tres tipos principales de usuarios:

**Paciente:**  
Usuario que solicita atención profesional. Podrá registrarse, iniciar sesión, consultar disponibilidad, solicitar turnos, visualizar sus reservas y realizar pagos o señas asociados a los turnos.

**Profesional:**  
Usuario que ofrece servicios relacionados con la salud mental o disciplinas afines. Podrá administrar su perfil, especialidad, modalidad de atención, disponibilidad horaria y turnos asignados.

**Administrador:**  
Usuario encargado de la gestión general del sistema. Podrá administrar usuarios, profesionales, especialidades y supervisar el funcionamiento general de la plataforma.

---

## 5. Funcionalidades principales

Las funcionalidades principales previstas para Mental Connection son:

- Registro e inicio de sesión de usuarios.
- Gestión de roles: paciente, profesional y administrador.
- Gestión de pacientes.
- Creación y edición de perfil profesional.
- Gestión de especialidades.
- Carga y administración de disponibilidad horaria.
- Solicitud de turnos por parte del paciente.
- Confirmación, cancelación o modificación de turnos.
- Panel de agenda para profesionales.
- Panel administrativo para gestión de usuarios, profesionales y especialidades.
- Visualización de turnos pendientes, confirmados y cancelados.
- Gestión de pagos o señas de turnos mediante integración con Mercado Pago.

---

## 6. API de terceros

El proyecto contempla la integración con Mercado Pago API como servicio externo para la gestión de pagos o señas asociados a los turnos.

Esta integración permitirá conectar Mental Connection con una plataforma de pagos externa, agregando una funcionalidad real de comunicación entre sistemas mediante API.

El objetivo inicial será implementar o simular un flujo básico donde un turno pueda quedar asociado a un estado de pago, por ejemplo: pendiente, abonado, rechazado o cancelado.

---

## 7. Alcance inicial del proyecto

En una primera versión, Mental Connection se enfocará en la gestión de usuarios, profesionales, pacientes, especialidades, disponibilidad horaria, turnos y pagos o señas mediante Mercado Pago.

El sistema no incluirá en esta etapa historia clínica, diagnósticos médicos, recetas digitales ni atención de emergencias.

Tampoco se incluirá una búsqueda pública de profesionales como marketplace, ya que el objetivo principal del trabajo será resolver la organización administrativa interna de turnos y reservas.

Estas funcionalidades podrían considerarse como mejoras futuras, pero no forman parte del alcance inicial para mantener el proyecto viable dentro de los plazos de la asignatura.

---

## 8. Tecnologías a utilizar

Para el desarrollo de Mental Connection se propone utilizar las siguientes tecnologías:

**Frontend:**  
React.js con TypeScript

**Backend / Servicios:**  
Supabase, utilizando sus servicios de autenticación, base de datos, políticas de seguridad y funciones serverless.

**Base de datos:**  
PostgreSQL mediante Supabase

**Autenticación:**  
Supabase Auth, con manejo de usuarios y roles.

**Funciones del lado del servidor:**  
Supabase Edge Functions con TypeScript, en caso de requerir lógica personalizada para validaciones de turnos, estados de pago o reglas específicas del sistema.

**API de terceros:**  
Mercado Pago API para la gestión de pagos o señas de turnos.

**Control de versiones:**  
Git y GitHub

**Despliegue:**  
Frontend en Vercel o Netlify. Backend, autenticación y base de datos mediante Supabase.

---

## 9. Módulos a desarrollar

Los módulos iniciales del sistema serán:

**Módulo de autenticación:**  
Registro, inicio de sesión y manejo de roles.

**Módulo de pacientes:**  
Gestión de datos básicos del paciente y visualización de turnos solicitados.

**Módulo de profesionales:**  
Gestión del perfil profesional, especialidad, modalidad de atención y disponibilidad horaria.

**Módulo de turnos:**  
Solicitud, confirmación, cancelación y visualización de turnos.

**Módulo de pagos:**  
Integración con Mercado Pago para gestionar pagos o señas de turnos.

**Módulo de administración:**  
Gestión de usuarios, profesionales y especialidades.

**Módulo de agenda:**  
Visualización organizada de horarios disponibles y turnos asignados.

---

## 10. Plan de trabajo

**Etapa 1 - Propuesta y organización del proyecto:**  
Definición del problema, solución propuesta, alcance, tecnologías, API de terceros y creación del repositorio en GitHub.

**Etapa 2 - Diseño del sistema:**  
Definición de módulos, diseño de la base de datos, estructura general del proyecto y arquitectura inicial.

**Etapa 3 - Desarrollo inicial:**  
Implementación del registro, inicio de sesión, roles de usuario y estructura base del frontend y backend.

**Etapa 4 - Desarrollo de funcionalidades principales:**  
Implementación de perfiles profesionales, gestión de especialidades, disponibilidad horaria, gestión de turnos e integración con Mercado Pago para pagos o señas.

**Etapa 5 - Pruebas y ajustes:**  
Verificación del funcionamiento general, corrección de errores y mejoras en la experiencia de usuario.

**Etapa 6 - Despliegue y documentación final:**  
Publicación del sistema en servicios online, finalización del informe, documentación del repositorio y preparación del video explicativo.

---

## 11. Repositorio GitHub

El proyecto será desarrollado y centralizado en un único repositorio de GitHub, donde se alojará el código fuente, la documentación, los avances, el diseño de la base de datos y los archivos correspondientes a las entregas de la asignatura.

**Repositorio:**  
https://github.com/imjuxn/mental-connection

---

## 12. Conclusión

Mental Connection busca ofrecer una solución tecnológica útil para mejorar la organización administrativa de servicios relacionados con la salud mental.

La plataforma permitirá centralizar la gestión de profesionales, pacientes, disponibilidad horaria, turnos y pagos o señas asociados a reservas, beneficiando tanto a pacientes como a profesionales.

El proyecto resulta viable para el Trabajo Final Integrador, ya que permite aplicar conocimientos de desarrollo frontend, backend, base de datos, autenticación, diseño de módulos, integración con APIs externas, documentación y despliegue en la nube.
