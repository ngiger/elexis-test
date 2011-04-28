#!/usr/bin/env ruby

cmds = [
#  'LicenseType name:string description:string',

#  'ProductModule name:string description:string ' +
#  ' license_type_id:string',

#  'DeployState name:string description:string ',

#  'ProductVersion name:string description:string remarks:text  '+
#  ' user_id:integer deploy_state_id:integer product_module_id:integer',

#  'TestEnvironment name:string description:string',

  'TestResultType name:string description:string',
  
  'TestStep name:string description:text smoketest:boolean '+
  ' criteria:text product_module_id:integer test_case_id:integer',

  'TestCase name:string description:text criteria:text ' +
  ' product_module_id:integer test_environment_id:integer estimated_time:integer'+
  ' test_step_id:integer test_suite_id:integer',

  'TestSuite product_version_id:integer remarks:text user_id:integer'+
  ' closed:date  user_id:integer test_case_id:integer ',
  
  'TestRunStep test_step_id:integer remarks:text '+
  ' when:datetime test_result_type_id:integer',

  'TestRunCase test_case_id:integer remarks:text user_id:integer'+
  ' when:datetime test_result_type_id:integer time_needed:integer',

  'TestRunSuite test_suite_id:integer remarks:text user_id:integer deploy_state_id:integer'+
  ' when:datetime test_result_type_id:integer time_estimated:integer time_needed:integer',
]

cmds.each{ |x|
  cmd = "rails generate nifty:scaffold #{x} --haml "
  puts cmd
}

