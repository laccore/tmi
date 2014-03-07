/*
-- Query: SELECT CONCAT('ALTER TABLE ', table_name, ' ENGINE=InnoDB;') as 
     ExecuteTheseSQLCommands FROM information_schema.tables 
     WHERE table_schema = 'tmi_test_myrboa'  
     ORDER BY table_name DESC
LIMIT 0, 10000

-- Date: 2013-12-06 14:51
*/
ALTER TABLE xap_resource ENGINE=InnoDB;
ALTER TABLE user_role ENGINE=InnoDB;
ALTER TABLE user ENGINE=InnoDB;
ALTER TABLE tag_links ENGINE=InnoDB;
ALTER TABLE tag_editor_unique_identification ENGINE=InnoDB;
ALTER TABLE tag_editor_image ENGINE=InnoDB;
ALTER TABLE tag_editor ENGINE=InnoDB;
ALTER TABLE tags ENGINE=InnoDB;
ALTER TABLE smear_slide_component ENGINE=InnoDB;
ALTER TABLE smear_slide ENGINE=InnoDB;
ALTER TABLE sediment_component ENGINE=InnoDB;
ALTER TABLE role ENGINE=InnoDB;
ALTER TABLE requestmap ENGINE=InnoDB;
ALTER TABLE registration_code ENGINE=InnoDB;
ALTER TABLE node ENGINE=InnoDB;
ALTER TABLE light_type ENGINE=InnoDB;
ALTER TABLE imposter ENGINE=InnoDB;
ALTER TABLE image ENGINE=InnoDB;
ALTER TABLE identification_type ENGINE=InnoDB;
ALTER TABLE glossary ENGINE=InnoDB;
ALTER TABLE faq ENGINE=InnoDB;
ALTER TABLE external_resource ENGINE=InnoDB;
ALTER TABLE edge ENGINE=InnoDB;
ALTER TABLE drive_section ENGINE=InnoDB;
ALTER TABLE corer_type ENGINE=InnoDB;
ALTER TABLE content ENGINE=InnoDB;
ALTER TABLE contact_form ENGINE=InnoDB;
