---
layout: page
permalink: /repositories/
title: repositories
description: 
nav: true
nav_order: 3
---

## GitHub user

{% assign github_users = site.data.github_stats.users | default: site.data.repositories.github_users %}
{% if github_users %}
<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in github_users %}
    {% assign username = user.slug | default: user %}
    {% include repository/repo_user.html username=username user=user %}
  {% endfor %}
</div>

---

{% if site.repo_trophies.enabled %}
{% for user in github_users %}
  {% assign username = user.slug | default: user %}
  {% if github_users.size > 1 %}
  <h4>{{ username }}</h4>
  {% endif %}
  <div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% include repository/repo_trophies.html username=username user=user %}
  </div>

  ---

{% endfor %}
{% endif %}
{% endif %}

## GitHub Repositories

{% assign github_repos = site.data.github_stats.repos | default: site.data.repositories.github_repos %}
{% if github_repos %}
<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in github_repos %}
    {% assign repository = repo.slug | default: repo %}
    {% include repository/repo.html repository=repository repo=repo %}
  {% endfor %}
</div>
{% endif %}
