#README


##Link
[Link to pa9.club](http://www.pa9.club/)


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

#####Stores :
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
	      hours_sunday: "string",
	      comments_count: integer,
	      updated_at: "2015-11-01T10:10:10.000+08:00"
		}
	]
}
```

#####Show Dj :
>/api/v1/djs/:id

#####Api login :
>/api/v1/login
>
>Facebook access_token

#####Api logout :
>/api/v1/logout

#####Create comment :
>/api/v1/comments

```
# method => post
params{
	"auth_token": string,
	"rating": integer, # 1 to 5 
	"content": string, 
	"store_id": integer
}
```

#####Delete comment :
>/api/v1/comments/:id

```
method => delete
params{
	"auth_token": string,
}
```
