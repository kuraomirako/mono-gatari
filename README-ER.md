```mermaid
erDiagram

  users ||--o{ stories : has_many
  users ||--o{ comments : has_many
  users ||--o{ reactions : has_many
  users ||--o{ bookmarks : has_many
  users ||--o{ relationships : has_many
  users ||--o{ bookmarked_stories : has_many_through

  stories ||--o{ comments : has_many
  stories ||--o{ reactions : has_many
  stories ||--o{ bookmarks : has_many

  comments ||--|| users : belongs_to
  comments ||--|| stories : belongs_to

  reactions ||--|| users : belongs_to
  reactions ||--|| stories : belongs_to

  bookmarks ||--|| users : belongs_to
  bookmarks ||--|| stories : belongs_to

  relationships ||--|| users : follower_and_followed
```