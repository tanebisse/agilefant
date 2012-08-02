package fi.hut.soberit.agilefant.db.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import fi.hut.soberit.agilefant.db.BacklogHistoryEntryDAO;
import fi.hut.soberit.agilefant.model.BacklogHistoryEntry;
import fi.hut.soberit.agilefant.util.ProjectBurnupData;

@Repository("backlogHistoryEntryDAO")
public class BacklogHistoryEntryDAOHibernate extends
        GenericDAOHibernate<BacklogHistoryEntry> implements
        BacklogHistoryEntryDAO {

    public BacklogHistoryEntryDAOHibernate() {
        super(BacklogHistoryEntry.class);
    }

    public BacklogHistoryEntry retrieveLatest(DateTime timestamp, int backlogId) {
        Criteria crit = getCurrentSession().createCriteria(
                BacklogHistoryEntry.class);
        crit.add(Restrictions.eq("backlog.id", backlogId));
        crit.add(Restrictions.le("timestamp", timestamp));
        crit.addOrder(Order.desc("timestamp"));
        crit.setMaxResults(1);
        return uniqueResult(crit);
    }

    public ProjectBurnupData retrieveBurnupData(int projectId) {
        Criteria crit = getCurrentSession().createCriteria(
                BacklogHistoryEntry.class);
        crit.add(Restrictions.eq("backlog.id", projectId));
        crit.addOrder(Order.asc("timestamp"));
        crit
                .setProjection(Projections.projectionList().add(
                        Projections.groupProperty("timestamp")).add(
                        Projections.max("estimateSum")).add(
                        Projections.max("doneSum")).add(Projections.max("branchMax")));
        List<Object[]> data = asList(crit);
        List<Object[]> newData = new ArrayList<Object[]>();
        for(Object[] row : data) {
            long rest = ((Number)row[1]).longValue()-((Number)row[2]).longValue();
            Object[] newRow = new Object[5];
            newRow[0] = row[0];
            newRow[1] = row[1];
            newRow[2] = row[2];
            newRow[3] = row[3];
            newRow[4] = rest;
            newData.add(newRow);
        }
        return ProjectBurnupData.createFromRawData(newData);
    }
}
