<?php

namespace Modules\Setting\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Setting\Entities\Setting;

class SettingDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::create([
            'company_name' => 'TechBurg POS',
            'company_email' => 'info@techburg.tech',
            'company_phone' => '+255 763 739888',
            'notification_email' => 'info@techburg.tech',
            'default_currency_id' => 1,
            'default_currency_position' => 'prefix',
            'footer_text' => 'TechBurg POS © ' . date('Y') . ' || Developed by <strong><a target="_blank" href="https://techburgenterprises.com">TechBurg Enterprises</a></strong>',
            'company_address' => 'Dar Es Salaam, Tanzania'
        ]);
    }
}
