package fi.hut.soberit.agilefant.business.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fi.hut.soberit.agilefant.business.ProjectTypeBusiness;
import fi.hut.soberit.agilefant.model.ProjectType;

@Service("projectTypeBusiness")
@Transactional
public class ProjectTypeBusinessImpl extends GenericBusinessImpl<ProjectType> implements
        ProjectTypeBusiness {

}
