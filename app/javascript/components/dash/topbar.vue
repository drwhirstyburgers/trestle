<template>
    <header class="app-header navbar">
      <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a href='#'>Trestle</a>
      <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
        <span class="navbar-toggler-icon"></span>
      </button>
      <ul class="nav navbar-nav d-md-down-none">
        <li class="nav-item px-3">
          <a href='#' class='nav-link'>Dashboard</a>
        </li>
        <li class="nav-item px-3">
            <a class="nav-link" href="https://sim.ametroslearning.com">Sim Platform</a>
        </li>
        <li class="nav-item"><a href="#">Login</a></li>
      </ul>
      
      <ul class="nav navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user fa-2x"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right">
          </div>
        </li>
      </ul>
    </header>
</template>