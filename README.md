# Unified Marketing Data Table Documentation

## Overview

![Tables](https://prnt.sc/Ws0tuP0X9ryu)

This SQL script creates a unified table inside **Google BigQuery** that consolidates marketing campaign data from three different advertising platforms: Facebook Ads, Google Ads, and TikTok Ads.

## Dependencies

- BigQuery project: `senior-mkt-analyst-assignment`
- Dataset: `senior_marketing_analyst_assignment`
- Required source tables:
  - `facebook_ads`
  - `google_ads`
  - `tiktok_ads`

## Table Details

**Target Table:** `senior-mkt-analyst-assignment.senior_marketing_analyst_assignment.unified_table`

## Data Sources

The unified table combines data from three source tables:

1. `facebook_ads`
2. `google_ads`
3. `tiktok_ads`

## Schema

### Fields Present in All Sources

| Field Name | Data Type | Description |
|------------|-----------|-------------|
| `date` | DATE | Campaign date |
| `campaign_id` | STRING | Unique campaign identifier |
| `campaign_name` | STRING | Campaign name |
| `ad_group_id` | STRING | Ad group/set identifier |
| `ad_group_name` | STRING | Ad group/set name |
| `impressions` | INTEGER | Number of times ads were displayed |
| `clicks` | INTEGER | Number of clicks received |
| `cost` | FLOAT | Total spend/cost |
| `conversions` | INTEGER | Number of conversions |
| `channel` | STRING | Source platform identifier |

### Platform-Specific Fields

#### Facebook Ads Metrics
- `video_views` - Number of video views
- `engagement_rate` - Engagement rate percentage
- `reach` - Unique users reached
- `frequency` - Average impressions per user

#### Google Ads Metrics
- `conversion_value` - Monetary value of conversions
- `ctr` - Click-through rate
- `avg_cpc` - Average cost per click
- `quality_score` - Google's quality score metric
- `search_impression_share` - Percentage of impressions received

#### TikTok Ads Metrics
- `video_views` - Number of video views
- `video_watch_25` - Views reaching 25% completion
- `video_watch_50` - Views reaching 50% completion
- `video_watch_75` - Views reaching 75% completion
- `video_watch_100` - Views reaching 100% completion
- `likes` - Number of likes
- `shares` - Number of shares
- `comments` - Number of comments

## Field Mappings

### Source Field Standardization

The script standardizes different field names across platforms:

| Unified Field | Facebook Ads | Google Ads | TikTok Ads |
|---------------|--------------|------------|------------|
| `ad_group_id` | `ad_set_id` | `ad_group_id` | `adgroup_id` |
| `ad_group_name` | `ad_set_name` | `ad_group_name` | `adgroup_name` |
| `cost` | `spend` | `cost` | `cost` |

## Null Handling

Platform-specific metrics are set to `NULL` for platforms that don't provide those metrics. This ensures consistent schema across all records while preserving data integrity.

## Maintenance

### Updating the Table

To refresh the unified table with the latest data, simply re-run the script. The `CREATE OR REPLACE` statement will overwrite the existing table.

### Adding New Platforms

To add a new advertising platform:

1. Add a new `UNION ALL` section
2. Map the platform's fields to the unified schema
3. Set platform-specific fields to `NULL` where not applicable
4. Add a unique `channel` identifier

## Notes

- The script uses `UNION ALL` for better performance (no deduplication needed)
- All monetary values should be in the same currency for accurate cross-platform analysis
- Date formats are standardized across all platforms
- The `channel` field enables easy filtering and segmentation by platform
