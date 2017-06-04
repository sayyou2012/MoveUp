//
//  EarthCoordinateToMarsCoordinate.m
//  MoveUp
//
//  Created by sayyou2012 on 17/6/4.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "EarthCoordinateToMarsCoordinate.h"

@implementation EarthCoordinateToMarsCoordinate

const double pi = 3.14159265358979324;
const double a = 6378245.0;
const double ee = 0.00669342162296594323;

+ (CLLocationCoordinate2D)getMarsCoorWithEarthCoor:(CLLocationCoordinate2D)earthCoor
{
    CLLocationCoordinate2D marsCoor;
    if (outOfChina(earthCoor.latitude, earthCoor.longitude)) {
        marsCoor = earthCoor;
        return marsCoor;
    }
    double dLat = transformLat(earthCoor.longitude-105.0, earthCoor.latitude-35.0);
    double dLon = transformLon(earthCoor.longitude-105.0, earthCoor.latitude-35.0);
    double radLat = earthCoor.latitude/180.0*pi;
    double magic = sin(radLat);
    magic = 1-ee*magic*magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * pi);
    marsCoor = CLLocationCoordinate2DMake(earthCoor.latitude+dLat, earthCoor.longitude+dLon);
    return marsCoor;
}

static bool outOfChina(double lat, double lon)
{
    if (lon < 72.004 || lon > 137.8347)
        return true;
    if (lat < 0.8293 || lat > 55.8271)
        return true;
    return false;
}

static double transformLat(double x, double y)
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * pi) + 20.0 * sin(2.0 * x * pi)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * pi) + 40.0 * sin(y / 3.0 * pi)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * pi) + 320 * sin(y * pi / 30.0)) * 2.0 / 3.0;
    return ret;
}

static double transformLon(double x, double y)
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * pi) + 20.0 * sin(2.0 * x * pi)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * pi) + 40.0 * sin(x / 3.0 * pi)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * pi) + 300.0 * sin(x / 30.0 * pi)) * 2.0 / 3.0;
    return ret;
}

@end
