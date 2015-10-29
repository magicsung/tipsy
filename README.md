#README

##API v1

#####All Events:
>/api/v1/events

```
{	
-	metadata: {
		total: integer
		},
-	data: [
	-	{
			id: integer,
			title: "string",
			image: "img_url",
		-	dj: [
			-	{
					id: integer,
					name: "string",
					url: "dj_show_page_url"
				}
			]
		}
	]
}
```

#####Show Events:
>/api/v1/events/:id

#####Categories :
>/api/v1/categories

#####stores :
>/api/v1/stores


```
-	metadata: {
		total: integer
		},
-	data: [
	-	{
	      id: integer,
	      category_id: integer,
	      name: "string",
	      photo: "photo_url",
	      phone: "string",
	      description: "string",
	      city: "string",
	      address: "string",
	      lat: "string",
	      lon: "string",
	      hours_monday: "string",
	      hours_tuesday: "string",
	      hours_wensday: "string",
	      hours_thursday: "string",
	      hours_friday: "string",
	      hours_saturday: "string",
	      hours_sunday: "string"
		}
	]
}
```

#####Show Dj :
>/api/v1/djs/:id
