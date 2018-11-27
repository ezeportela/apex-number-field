prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.05.24'
,p_release=>'18.2.0.00.12'
,p_default_workspace_id=>3905662222880545602
,p_default_application_id=>1448
,p_default_owner=>'BANGHO'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_eportela_numberfield
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(13978710087365632440)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.EPORTELA.NUMBERFIELD'
,p_display_name=>'Number Field'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render(',
'  p_dynamic_action   in apex_plugin.t_dynamic_action,',
'  p_plugin           in apex_plugin.t_plugin',
') ',
'return apex_plugin.t_dynamic_action_render_result as',
'  l_result               apex_plugin.t_dynamic_action_render_result;',
'  l_allow_decimals       p_dynamic_action.attribute_01%TYPE := p_dynamic_action.attribute_01;',
'  l_decimal_separator    p_dynamic_action.attribute_02%TYPE := p_dynamic_action.attribute_02;',
'  l_allow_negatives      p_dynamic_action.attribute_03%TYPE := p_dynamic_action.attribute_03;',
'begin',
'  ',
'  l_allow_decimals := NVL(l_allow_decimals, ''N'');',
'  l_decimal_separator := NVL(l_decimal_separator, ''.'');',
'  l_allow_negatives := NVL(l_allow_negatives, ''N'');',
'  ',
'  -- debug',
'  if apex_application.g_debug then',
'    apex_plugin_util.debug_dynamic_action(',
'        p_plugin         => p_plugin,',
'        p_dynamic_action => p_dynamic_action',
'    );',
'  end if;',
'  ',
'  ',
'  apex_javascript.add_library(',
'      p_name        => ''script'',',
'      p_directory   => p_plugin.file_prefix || ''js/'',',
'      p_version     => null,',
'      p_skip_extension => false',
'  );',
'  ',
'  l_result.javascript_function := ''function () { ',
'               createNumberField(this, { ',
'                       allowDecimals: '' || apex_javascript.add_value( l_allow_decimals, true ) || ''',
'                       decimalSeparator: '' || apex_javascript.add_value( l_decimal_separator, true ) || ''',
'                       allowNegatives: '' || apex_javascript.add_value( l_allow_negatives, false ) || ''',
'               } ); ',
'     }'';',
'        ',
'  return l_result;',
'end;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'ITEM:JQUERY_SELECTOR:JAVASCRIPT_EXPRESSION:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plugin prevents the user from entering unnecessary characters in the fields whose type is number. It can be used as a dynamic action.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://github.com/ezeportela/apex-number-field'
,p_files_version=>15
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14113828546327974812)
,p_plugin_id=>wwv_flow_api.id(13978710087365632440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Allow Decimals'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Specify if the field allows decimals. By default, it doesn''t allow decimals.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14115235863590977742)
,p_plugin_id=>wwv_flow_api.id(13978710087365632440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Decimal Separator'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'.'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(14113828546327974812)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Specify the decimal separator. The point (.) is defined by default.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14116019812100980144)
,p_plugin_id=>wwv_flow_api.id(13978710087365632440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Allow Negatives'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Specify if the field allows negatives. By default, it doesn''t allow negatives.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '636F6E7374206372656174654E756D6265724669656C64203D20280A20207B200A202020206166666563746564456C656D656E7473200A20207D2C200A20207B0A20202020616C6C6F77446563696D616C732C200A20202020646563696D616C53657061';
wwv_flow_api.g_varchar2_table(2) := '7261746F722C200A20202020616C6C6F774E65676174697665730A20207D0A29203D3E207B0A0A2020636F6E737420636F6E7461696E73203D2028746578742C2073656172636829203D3E20746578742E73706C697428736561726368292E6C656E6774';
wwv_flow_api.g_varchar2_table(3) := '68202D2031203E20300A0A2020666F722028656C656D656E74206F66206166666563746564456C656D656E747329207B0A202020200A202020202428656C656D656E74292E6F6E28276B65797072657373272C206576656E74203D3E207B0A2020202020';
wwv_flow_api.g_varchar2_table(4) := '200A202020202020636F6E737420696E70757456616C7565203D206576656E742E7461726765742E76616C75650A20202020202024286576656E742E746172676574292E616464436C6173732827706C7567696E2D6E756D6265722D6669656C6427290A';
wwv_flow_api.g_varchar2_table(5) := '20200A202020202020696620286576656E742E6B6579436F6465203E3D203438202626206576656E742E6B6579436F6465203C3D203537290A202020202020202072657475726E20747275650A20200A20202020202069662028616C6C6F77446563696D';
wwv_flow_api.g_varchar2_table(6) := '616C73203D3D3D202759270A202020202020202020202626206576656E742E6B6579436F6465203D3D3D20646563696D616C536570617261746F722E63686172436F646541742830290A2020202020202020202026262021636F6E7461696E7328696E70';
wwv_flow_api.g_varchar2_table(7) := '757456616C75652C20646563696D616C536570617261746F7229290A202020202020202072657475726E20747275650A20200A202020202020696628616C6C6F774E6567617469766573203D3D3D202759270A202020202020202020202626206576656E';
wwv_flow_api.g_varchar2_table(8) := '742E6B6579436F6465203D3D3D20343529207B0A20202020202020200A20202020202020206576656E742E7461726765742E76616C7565203D20636F6E7461696E7328696E70757456616C75652C20272D2729200A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(9) := '20202020202020202020202020202020203F20696E70757456616C75652E7265706C61636528272D272C20272729200A20202020202020202020202020202020202020202020202020202020202020203A20272D27202B20696E70757456616C75650A20';
wwv_flow_api.g_varchar2_table(10) := '202020202020200A202020202020202072657475726E2066616C73650A2020202020207D0A20200A20202020202072657475726E2066616C73650A202020207D290A20207D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(14831983884296147211)
,p_plugin_id=>wwv_flow_api.id(13978710087365632440)
,p_file_name=>'js/script.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
