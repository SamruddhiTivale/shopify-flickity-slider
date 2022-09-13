<!-- partial:index.partial.html -->
<div class="container page-width">
  <div class="row is-flex-row ">
    {% if section.settings.title != blank %}
    <div class="section-header">
      <h2>{{ section.settings.title | escape }}</h2>
      <p>{{ section.settings.subtitle }}</p>
    </div>
  {% endif %}
    <div class="sixteen text-align-center">
     <div class="carousel" data-flickity='{ "groupCells": "true", "wrapAround": "false" }'>
        {% for block in section.blocks %}
       		<div class="image-slider-section">
              <div class="carousel-cell" style="background-image:url({{ block.settings.img1 }})">
                <div class="inner-data">
                {% if block.settings.text1 !=blank %}
                  <h3 class="title">{{block.settings.text1}}</h3>
                {% endif %}
                {% if block.settings.description != blank %}
                  <p class="description">{{ block.settings.description }}</p>
                {% endif %}
                {% if block.settings.btnUrl !=blank and block.settings.btntext != blank %}
                  <a class="btn-collection-slider" href="{{ block.section.btnUrl }}">{{ block.settings.btntext }}</a>
                {% endif %}
                </div>
              </div>
       		</div>
       {% endfor %}
        
      </div>
      </div>
    </div>
  </div>

{% schema %}
  {
    "name": "Flickity slider",
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
  "blocks": [
	{
	  "type": "slider",
	  "name": "Image",
	  "settings": [
		{
        "id": "img1",
        "type": "url",
        "label": "Link Background"
        },
		{
        "id": "text1",
        "type": "text",
        "label": "Collection Title",
		"default": "John Doe"
        },
        {
          "type" : "html",
          "id" : "description",
          "label" : "Description",
          "default" : "Lorem Ipsum"
        },
        {
          "type" : "text",
          "id" : "btntext",
          "label" : "Button Text"
        },
        {
          "type" : "url",
          "id" : "btnUrl",
          "label" : "Button URL"
        }
	]
  }
],
"presets": [
	{
		"name": "Flickity slider",
		"category": "Custom"
	}
	]
  }
{% endschema %}


<style>
</style>
<script>
$('.carousel').flickity({
  asNavFor: '.carousel-cell',
  contain: true,
  pageDots: false,
  wrapAround: false

});
</script>

<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">

  <script src='https://npmcdn.com/flickity@2/dist/flickity.pkgd.js'></script>

