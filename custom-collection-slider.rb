<div class="page-width" data-section-id="{{ section.id }}" data-section-type="quotes">
  {% if section.settings.title != blank %}
    <div class="section-header">
      <h2>{{ section.settings.title | escape }}</h2>
      <p>{{ section.settings.subtitle }}</p>
    </div>
  {% endif %}

  {% if section.blocks.size > 0 %}
    <div class="quotes-wrapper" data-slider>
      <div class="quotes-slider-wrapper" data-slider-container>
        <div class="quotes-slider" id="Quotes-{{ section.id }}" data-count="{{ section.blocks.size }}" data-slider-track>
          {% for block in section.blocks %}
            <div id="slickSlide{{ block.id }}"
              class="quotes-slide quotes-slide--{{ block.id }}{% if section.blocks.size == 1 %} quotes-slide--single{% endif %}"
              aria-labelledby="slickDot{{ block.id }}"
              {{ block.shopify_attributes }}
              data-slider-slide-index="{{ forloop.index0 }}"
              data-slider-item>

            <div class="collection-data-text" style="background-image:url({{ block.settings.back-image }})" >
              <div class="inner-data">
              {% if block.settings.collectiontitle != blank %}
                  <h3>{{ block.settings.collectiontitle }}</h3>
              {% endif %}
              {% if block.settings.description != blank %}
                  <p>{{ block.settings.description }}</p>
              {% endif %}
              {% if block.settings.buttonurl != blank and block.settings.buttontxt !=blank %}
                  <a href="{{ block.settings.buttonurl }}" class="btn-collection-slider">{{ block.settings.buttontxt }}</a>
              {% endif %}
              </div>
            </div>

            </div>
          {% endfor %}
        </div>
      </div>

      {% if section.blocks.size > 1 %}
        <ul class="slick-dots{% if section.blocks.size < 4 %} slick-dots--mobile-only{% endif %}" data-slider-indicators>
          {%- for block in section.blocks -%}
            <li{% if forloop.first %} class="slick-active"{% endif %} data-slider-indicator>
              <button id="slickDot{{ block.id }}"
                aria-label="{{ 'sections.slideshow.load_slide' | t: slide_number: forloop.index }}"
                data-slide-number="{{ forloop.index0 }}"
                aria-controls="slickSlide{{ block.id }}"></button>
            </li>
          {%- endfor -%}
        </ul>
      {% endif %}
    </div>
  {% endif %}

  {% if section.blocks.size == 0 %}
    {% include 'no-blocks' %}
  {% endif %}
</div>

{% schema %}
  {
    "name": "Custom Section Slider",
    "class": "index-section",
    "max_blocks": 9,
    "settings": [
      {
        "type" : "text",
        "id" : "title",
        "label" : "Heading",
        "default" : "Collections"
      },
      {
        "type" : "richtext",
        "id" : "subtitle",
        "label" : "Sub Heading"
      }
    ],
    "blocks" : [
      {
        "type" : "slider",
        "name" : "Collection Slider",
        "settings" : [
          {
            "type" : "url",
            "id" : "back-image",
            "label" : "Collection Image"
          },
          {
            "type" : "text",
            "id" : "collectiontitle",
            "label" : "Collection Heading",
            "default" : "Featured Collection"
          },
          {
            "type" : "html",
            "id" : "description",
            "label" : "Text Paragraph",
            "default" : "<p>This is the Description</p>"
          },
          {
            "type" : "text",
            "id" : "buttontxt",
            "label" : "Button Text"
          },
          {
            "type" : "url",
            "id" : "buttonurl",
            "label" : "Button URL"
          }
          
        ]
      }
    ],
    "presets": [
      {
        "name" : "Custom Section Slider",
        "blocks": [
        {
          "type": "slider"
        },
        {
          "type": "slider"
        },
        {
          "type": "slider"
        }
      ]
      }
    ]
  }
{% endschema %}
