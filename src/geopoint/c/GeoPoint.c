#include <stdio.h>
#include <stdlib.h>

#define GEO_OK          1
#define GEO_ERROR       -10000
#define GEO_INVALID_LAT -10001
#define GEO_INVALID_LON -10002

float check_longitude(float lon) {
    if (lon < -180 || lon > 180)
        return GEO_INVALID_LON;
        
    return lon;
}

float check_latitude(float lat) {
    if (lat <= -90 || lat > 90)
        return GEO_INVALID_LAT;
        
    return lat;
}

typedef struct {
    float lat;
    float lon;
} GeoPoint;

int geopoint_check_error(GeoPoint *geo) {
    if (geo->lat < GEO_ERROR)
        return GEO_INVALID_LAT;
    if (geo->lon < GEO_ERROR)
        return GEO_INVALID_LON;
    return GEO_OK;
}

char *geopoint_error_message(int error) {
    switch (error) {
        case GEO_INVALID_LAT:
            return "latitude is invalid";
        case GEO_INVALID_LON:
            return "longitude is invalid";
        default:
            return "OK";
    }
}

void geopoint_init(GeoPoint *geo, float lat, float lon) {
    geo->lat = check_latitude(lat);
    geo->lon = check_longitude(lon);
}

void geopoint_set_lat(GeoPoint *geo, float lat) {
    geo->lat = check_latitude(lat);
}

void geopoint_set_lon(GeoPoint *geo, float lon) {
    geo->lon = check_longitude(lon);
}

char *geopoint_gist(char *out, size_t size, GeoPoint *geo) {
    snprintf(out, size, "%s%f %s%f",
        geo->lat >= 0 ? "N" : "S",
        fabs(geo->lat),
        geo->lon >= 0 ? "E" : "W",
        fabs(geo->lon)
    );
    
    return out;
}

void die(char *msg) {
    printf("%s", msg);
    exit(1);
}

int main(void) {
    GeoPoint geo;
    geopoint_init(&geo, 39.1915045, -96.6070506);
    
    int error = geopoint_check_error(&geo);
    if (error != GEO_OK)
        die(geopoint_error_message(error));
    
    printf("%f\n", geo.lat);
    printf("%f\n", geo.lon);
    
    char *msg = malloc(255);
    printf("%s\n", geopoint_gist(msg, 255, &geo));
    free(msg);
    
    return 0;
}
