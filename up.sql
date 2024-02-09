DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS priorities;

CREATE TABLE priorities (
  id_priority SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE status (
  id_status SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE tasks (
  id_task SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(500) NULL,
  begin_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  priorities_id INT NOT NULL,
  status_id INT NOT NULL,
  CONSTRAINT fk_tasks_priorities
    FOREIGN KEY (priorities_id)
    REFERENCES priorities (id_priority)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tasks_status1
    FOREIGN KEY (status_id)
    REFERENCES status (id_status)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO priorities (name, description) VALUES
('URGENTE', 'Tareas que requieren atención inmediata'),
('NORMAL', 'Tareas que deben completarse en un plazo razonable'),
('BAJO', 'Tareas con baja prioridad que pueden posponerse si es necesario');

INSERT INTO status (name, description) VALUES
('INICIADA', 'La tarea ha sido iniciada pero aún no está completa'),
('EN PROCESO', 'La tarea está en progreso'),
('TERMINADA', 'La tarea ha sido completada satisfactoriamente');

INSERT INTO tasks (name, description, begin_date, end_date, priorities_id, status_id) VALUES
('Planificar rutas de entrega', 'Planificar las rutas de entrega para los productos', '2024-02-08 08:00:00', '2024-02-08 10:00:00', 1, 1),
('Coordinar envíos con transportistas', 'Coordinar con los transportistas los horarios y detalles de entrega', '2024-02-08 10:00:00', '2024-02-08 12:00:00', 2, 2),
('Resolver incidencias de entrega', 'Atender y resolver cualquier incidencia que surja durante las entregas', '2024-02-08 12:00:00', '2024-02-08 14:00:00', 3, 1),
('Actualizar inventario', 'Actualizar el inventario de productos en el sistema', '2024-02-08 14:00:00', '2024-02-08 16:00:00', 2, 3);
