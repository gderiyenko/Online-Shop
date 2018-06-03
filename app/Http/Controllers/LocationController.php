<?php

namespace App\Http\Controllers;

use Hash;
use Mail;
use App\Product;
use App\ProductType;
use App\Basket;
use App\User;
use App\Role;
use App\Address;
use App\Order;
use App\Region;
use App\BasketInfo;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class LocationController extends Controller
{
    // country-region-city
    public static function findRegion()
    {
        $country = intval($_GET['country']);
        $result = Region::findRegionByCountry($country);

        echo '<select name="region" class="form-control" onchange="getCity(this.value)" style="height: 34px">';
        echo "<option>Select State</option>";
        foreach ($result as $key => $value)  { 
            echo "<option value=" . $result[$key]->id . ">" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }

    public function findCity()
    {
        $region = intval($_GET['region']);
        $result = Region::findCityByRegion($region);

        echo '<select name="city" class="form-control" style="height: 34px">';
        echo '<option>Select City</option>';
        foreach ($result as $key => $value)  { 
            echo "<option value=" . $result[$key]->id . ">" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }
    // edit for Admin
    public static function editRegion()
    {
        $country = intval($_GET['country']);
        $result = Region::findRegionByCountry($country);

        echo '<select name="region" class="form-control" onchange="getCity(this.value)" style="height: 34px" required>';
        echo "<option value=''>Select State</option>";
        foreach ($result as $key => $value)  { 
            echo "<option value='" . $result[$key]->id . "'>" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }

    public function editCity()
    {
        $region = intval($_GET['region']);
        $result = Region::findCityByRegion($region);

        echo '<select name="city" class="form-control" style="height: 34px" required>';
        echo '<option value="">Select City</option>';
        foreach ($result as $key => $value)  { 
            echo "<option value='" . $result[$key]->id . "'>" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }
}
