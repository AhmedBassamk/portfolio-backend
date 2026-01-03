<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\Skill;
use App\Models\Experience;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    public function projects()
    {
        return response()->json([
            'data' => Project::latest()->get()
        ]);
    }

    public function skills()
    {
        return response()->json([
            'data' => Skill::all()
        ]);
    }

    public function experience()
    {
        return response()->json([
            'data' => Experience::latest()->get()
        ]);
    }
}
