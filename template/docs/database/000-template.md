# Table: table_name

## Description
What data does this table store?

## Fields
| Field | Type | Description | Notes |
|-------|------|-------------|-------|
| id | UUID | Primary key | Auto-generated |
| created_at | timestamp | Creation time | Default: now() |

## Relationships
- `belongs_to`: other_table (via foreign_key)
- `has_many`: related_table

## Indexes
| Index Name | Fields | Purpose |
|------------|--------|---------|
| idx_table_field | field_name | Speed up lookups |

## Sample Query
```sql
SELECT * FROM table_name WHERE condition;
```

## Quirks
- Any non-obvious behaviors or constraints
- Migration history notes

## Related Tables
- [other_table](other_table.md)
