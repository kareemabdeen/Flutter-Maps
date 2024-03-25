
# Mapit

source code for Google Maps


## App Features

- Provide destination Latitude and Longitude.
- Show markers for source and destination locations.
- Draw polyline for the closest path between source and destination.
- Navigate destination to google map app and use route direction.


## API Reference

#### Get Places Suggestions

```http
  GET https://maps.googleapis.com/maps/api/place/autocomplete/json?key=&input=&sessiontoken=sesstionToken
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `input` | `string` | **Required**. User Input |
| `SessionToken` | `string` | **Required**. Generated One |

#### Get Place Details

```http
  GET https://maps.googleapis.com/maps/api/place/details/json?key=&sessiontoken=&place_id=&fields=geometry
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `place_id`      | `string` | **Required**. place_id  |
| `fields`      | `string` | **Optional**. geometry  |
| `api_key` | `string` | **Required**. Your API key |



## Screenshots
### Login Screen
![App Screenshot](https://github.com/kareemabdeen/Flutter-Maps/blob/59c3ef9a37f0979278a6cee80fc0d47c642d8d1c/lib/assets/images/login%20screen.jpg)


### Otp Screen
![App Screenshot](https://github.com/kareemabdeen/Flutter-Maps/blob/59c3ef9a37f0979278a6cee80fc0d47c642d8d1c/lib/assets/images/otp%20screen.jpg)


### Loading Screen
![Screenshot_20240325-170407](https://github.com/kareemabdeen/Flutter-Maps/assets/118139061/e87e2506-7350-4456-8629-6d5289d7186b)


### Maps Screen
![Screenshot_20240325-170501](https://github.com/kareemabdeen/Flutter-Maps/assets/118139061/b616dd04-e971-459c-9e25-75dff5fff1c4)


### Search Screen
![Screenshot_20240325-170547](https://github.com/kareemabdeen/Flutter-Maps/assets/118139061/aac53bf0-364d-4893-93a9-3483781a4ba3)


### Drawer 
![Screenshot_20240325-170506](https://github.com/kareemabdeen/Flutter-Maps/assets/118139061/adf2573b-4733-4544-83c9-a2b177a80e4a)

