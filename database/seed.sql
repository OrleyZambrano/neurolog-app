-- ================================================================
-- NEUROLOG APP - SEED DATA (Datos de Inicialización)
-- ================================================================
-- Este archivo contiene los datos iniciales para el proyecto Arquitectura5B
-- Referencia al archivo principal: scripts/basedatos.sql

-- ================================================================
-- DATOS INICIALES DE CATEGORÍAS
-- ================================================================

-- Insertar categorías predeterminadas
INSERT INTO categories (name, description, color, icon, sort_order) VALUES
('Comunicación', 'Registro de avances en comunicación verbal y no verbal', '#3B82F6', 'message-circle', 1),
('Conducta', 'Observaciones sobre comportamiento y autorregulación', '#EF4444', 'activity', 2),
('Social', 'Interacciones sociales y habilidades interpersonales', '#10B981', 'users', 3),
('Académico', 'Progreso en actividades educativas y cognitivas', '#F59E0B', 'book-open', 4),
('Motor', 'Desarrollo motor fino y grueso', '#8B5CF6', 'zap', 5),
('Sensorial', 'Respuestas a estímulos sensoriales', '#EC4899', 'eye', 6)
ON CONFLICT (name) DO NOTHING;

-- ================================================================
-- DATOS DE EJEMPLO (OPCIONAL)
-- ================================================================

-- Nota: Los datos de usuarios se crean automáticamente a través de Supabase Auth
-- Los niños y registros se crean a través de la aplicación web

-- ================================================================
-- VERIFICACIÓN DE INTEGRIDAD
-- ================================================================

-- Verificar que las categorías se insertaron correctamente
DO $$
BEGIN
  IF (SELECT COUNT(*) FROM categories) < 6 THEN
    RAISE EXCEPTION 'Error: No se insertaron todas las categorías requeridas';
  END IF;
  
  RAISE NOTICE 'Seed data insertado correctamente. Categorías disponibles: %', 
    (SELECT COUNT(*) FROM categories);
END $$;
