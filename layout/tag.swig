{% extends 'includes/layout.swig' %}

{% block header %}
  <div class="Tag__header">
    <h1 class="Tag__title">{{ page.tag }}</h1>
  </div>
{% endblock %}

{% block body %}
  {% for postItem in page.posts.toArray() %}
    <article class="PostExcerpt">
      <header class="PostExcerpt__header">
        <a href="{{ config.root }}{{ postItem.path }}" class="PostExcerpt__title">{{ postItem.title }}</a>
      </header>
      <div class="PostExcerpt__meta">
        {% if postItem.date %}
          <time datetime="{{ postItem.date.toJSON() }}" class="PostExcerpt__date">
            {{ date(postItem.date) }}
          </time>
        {% endif %}
        {% if postItem.author %}
          <span class="PostExcerpt__author">
            by {{postItem.author}}
          </span>
        {% endif %}
      </div>
      {% if postItem.excerpt %}
        <div class="PostExcerpt__excerpt">
          {{ postItem.excerpt }} <a href="{{ config.root }}{{ postItem.path }}" class="PostExcerpt__readMore">Continue Reading</a> »
        </div>
      {% endif %}
    </article>
  {% endfor %}
  {% include 'includes/pagination.swig' %}
{% endblock %}
