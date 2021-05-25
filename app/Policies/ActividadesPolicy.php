<?php

namespace App\Policies;

use App\Models\User;

use Illuminate\Auth\Access\HandlesAuthorization;

class ActividadesPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
public function browse(User $user)
    {
        return true;
    }
public function add(User $user)
    {
        if ($user->hasRole("funcionarios"))
                return false;
        else
                return true;        
    }
public function delete(User $user)
    {
        if ($user->hasRole("funcionarios"))
        return false;
        else
        return true;
    }

public function edit(User $user)
    {
        if ($user->hasRole("funcionarios"))
        return false;
        else
        return true;
    }

}
