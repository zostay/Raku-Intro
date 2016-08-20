class Main {
    public static void main(String[] args) throws GeoPoint.GeoException {
        GeoPoint geo = new GeoPoint(39.1915045, -96.6070506);
        System.out.println(geo.getLat());
        System.out.println(geo.getLon());
        System.out.println(geo);
    }
}
