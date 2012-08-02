package fi.hut.soberit.agilefant.util;

public class Triple<First, Second, Third, Fourth> {

    public static final Triple<?, ?, ?, ?> EMPTY = create(null, null, null, null);

    public final First first;

    public final Second second;
    
    public final Third third;
    
    public final Fourth fourth;

    public Triple(First first, Second second, Third third, Fourth fourth) {
        this.first = first;
        this.second = second;
        this.third = third;
        this.fourth = fourth;
    }

    public First getFirst() {
        return first;
    }

    public Second getSecond() {
        return second;
    }
    
    public Third getThird() {
        return third;
    }
    
    public Fourth getFourth() {
        return fourth;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((first == null) ? 0 : first.hashCode());
        result = prime * result + ((second == null) ? 0 : second.hashCode());
        result = prime * result + ((third == null) ? 0 : third.hashCode());
        result = prime * result + ((fourth == null) ? 0 : fourth.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof Triple<?, ?, ?, ?>))
            return false;
        Triple<?, ?, ?, ?> other = (Triple<?, ?, ?, ?>) obj;
        if (first == null) {
            if (other.first != null)
                return false;
        } else if (!first.equals(other.first))
            return false;
        if (second == null) {
            if (other.second != null)
                return false;
        } else if (!second.equals(other.second))
            return false;
        if (third == null) {
            if (other.third != null)
                return false;
        }else if (!third.equals(other.third))
            return false;
        if (fourth == null) {
            if (other.fourth != null)
                return false;
        }else if (!fourth.equals(other.fourth))
            return false;
        return true;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("{[");
        if (first == null) {
            builder.append("null");
        } else {
            builder.append(first.toString());
        }
        builder.append("], [");
        if (second == null) {
            builder.append("null");
        } else {
            builder.append(second.toString());
        }
        builder.append("], [");
        if (third == null) {
            builder.append("null");
        } else {
            builder.append(third.toString());
        }
        builder.append("], [");
        if (fourth == null) {
            builder.append("null");
        } else {
            builder.append(fourth.toString());
        }
        builder.append("]}");
        return builder.toString();
    }

    public static <First, Second, Third, Fourth> Triple<First, Second, Third, Fourth> create(First first,
            Second second, Third third, Fourth fourth) {
        return new Triple<First, Second, Third, Fourth>(first, second, third, fourth);
    }
}
