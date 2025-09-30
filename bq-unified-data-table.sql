create or replace table `senior-mkt-analyst-assignment.senior_marketing_analyst_assignment.unified_table` as

-- Table facebook_ads
select
  date,
  campaign_id,
  campaign_name,
  ad_set_id as ad_group_id,
  ad_set_name as ad_group_name,
  impressions,
  clicks,
  spend as cost,
  conversions,
  video_views,
  engagement_rate,
  reach,
  frequency,
  null as conversion_value,
  null as ctr,
  null as avg_cpc,
  null as quality_score,
  null as search_impression_share,
  null as video_watch_25,
  null as video_watch_50,
  null as video_watch_75,
  null as video_watch_100,
  null as likes,
  null as shares,
  null as comments,
  'facebook_ads' as channel
from `senior-mkt-analyst-assignment.senior_marketing_analyst_assignment.facebook_ads`

union all 

-- Table google_ads
select
  date,
  campaign_id,
  campaign_name,
  ad_group_id,
  ad_group_name as ad_group_name,
  impressions,
  clicks,
  cost,
  conversions,
  null as video_views,
  null as engagement_rate,
  null as reach,
  null as frequency,
  conversion_value,
  ctr,
  avg_cpc,
  quality_score,
  search_impression_share,
  null as video_watch_25,
  null as video_watch_50,
  null as video_watch_75,
  null as video_watch_100,
  null as likes,
  null as shares,
  null as comments,
  'google_ads' as channel
from `senior-mkt-analyst-assignment.senior_marketing_analyst_assignment.google_ads`

union all 

-- Table tiktok_ads
select
  date,
  campaign_id,
  campaign_name,
  adgroup_id as ad_group_id,
  adgroup_name as ad_group_name,
  impressions,
  clicks,
  cost,
  conversions,
  video_views,
  null as engagement_rate,
  null as reach,
  null as frequency,
  null as conversion_value,
  null as ctr,
  null as avg_cpc,
  null as quality_score,
  null as search_impression_share,
  video_watch_25,
  video_watch_50,
  video_watch_75,
  video_watch_100,
  likes,
  shares,
  comments,
  'tiktok_ads' as channel
from `senior-mkt-analyst-assignment.senior_marketing_analyst_assignment.tiktok_ads`;