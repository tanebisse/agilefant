package fi.hut.soberit.agilefant.db;

import java.util.Collection;

import fi.hut.soberit.agilefant.model.Project;
import fi.hut.soberit.agilefant.model.User;

/**
 * Interface for a DAO of a Project.
 * 
 * @see GenericDAO
 */
public interface ProjectDAO extends GenericDAO<Project> {

    /**
     * Gets a collection of users assigned to the project.
     */
    public Collection<User> getAssignedUsers(Project project);
}