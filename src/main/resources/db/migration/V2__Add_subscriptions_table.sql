CREATE TABLE user_subscriptions (
  channel_id BIGINT NOT NULL REFERENCES usr,
  subscriber_id BIGINT NOT NULL REFERENCES usr,
  PRIMARY KEY (channel_id, subscriber_id)
)