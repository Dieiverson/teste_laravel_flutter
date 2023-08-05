<?
namespace App\Http\Controllers;

use App\Models\Mug;
use Illuminate\Http\Request;

class MugController extends Controller
{
    public function getQuantity()
    {
        $mug = Mug::first();
        if($mug == null)
        {
            return response()->json(['quantity' => 0]);
        }
        return response()->json(['quantity' => $mug->quantity]);
    }
    
    public function addMug()
    {
        $mug = Mug::firstOrCreate([]);
        $mug->quantity = $mug->quantity + 1;
        $mug->save();
        return response()->json(['quantity' => $mug->quantity]);
    }
    
    public function removeMug()
    {
        $mug = Mug::firstOrCreate([]); 
        $mug->quantity = max(0, $mug->quantity - 1);
        $mug->save();
        return response()->json(['quantity' => $mug->quantity]);
    }
}
