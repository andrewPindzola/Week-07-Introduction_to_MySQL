DROP TABLE IF EXISTS projects.project_category;
DROP TABLE IF EXISTS projects.step;
DROP TABLE IF EXISTS projects.material;
DROP TABLE IF EXISTS projects.project;
DROP TABLE IF EXISTS projects.category;



CREATE TABLE projects.project (
	project_id INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (project_id),
    project_name VARCHAR(128) NOT NULL,
    estimated_hours DECIMAL(7,2),
    actual_hours DECIMAL(7,2),
    difficulty INT,
    notes TEXT
);

CREATE TABLE projects.material (
	material_id INT NOT NULL,
	PRIMARY KEY (material_id),
    project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id)
    ON DELETE CASCADE,
    material_name VARCHAR(128) NOT NULL,
    num_required INT,
    cost DECIMAL(7,2)
);

CREATE TABLE projects.step (
	step_id INT NOT NULL,
    PRIMARY KEY (step_id),
    project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id)
    ON DELETE CASCADE,
    step_text TEXT NOT NULL,
    step_order INT NOT NULL
);
CREATE TABLE projects.category (
	category_id INT NOT NULL,
    PRIMARY KEY (category_id),
    category_name VARCHAR(128) NOT NULL

);
CREATE TABLE projects.project_category (
	project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id)
    ON DELETE CASCADE,
    CONSTRAINT project_id UNIQUE (category_ID),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
    ON DELETE CASCADE,
	CONSTRAINT category_id UNIQUE (project_id)
);