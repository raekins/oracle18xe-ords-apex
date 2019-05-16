BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'HR',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'hr',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;
/

BEGIN
  ORDS.define_module(
    p_module_name    => 'hrmodule',
    p_base_path      => 'hrmodule/',
    p_items_per_page => 0);
  
  ORDS.define_template(
   p_module_name    => 'hrmodule',
   p_pattern        => 'employees/');

  -- READ : All records.
  ORDS.define_handler(
    p_module_name    => 'hrmodule',
    p_pattern        => 'employees/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM employees',
    p_items_per_page => 0);

  -- READ : One Record
  ORDS.define_template(
   p_module_name    => 'hrmodule',
   p_pattern        => 'employees/:employee_id');

  ORDS.define_handler(
    p_module_name    => 'hrmodule',
    p_pattern        => 'employees/:employee_id',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM employees WHERE employee_id = :employee_id',
    p_items_per_page => 0);

  COMMIT;
END;
/
