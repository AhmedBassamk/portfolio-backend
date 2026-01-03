<?php

namespace App\Filament\Admin\Resources\Experiences;

use App\Filament\Admin\Resources\Experiences\Pages\CreateExperience;
use App\Filament\Admin\Resources\Experiences\Pages\EditExperience;
use App\Filament\Admin\Resources\Experiences\Pages\ListExperiences;
use App\Filament\Admin\Resources\Experiences\Pages\ViewExperience;
use App\Filament\Admin\Resources\Experiences\Schemas\ExperienceForm;
use App\Filament\Admin\Resources\Experiences\Schemas\ExperienceInfolist;
use App\Filament\Admin\Resources\Experiences\Tables\ExperiencesTable;
use App\Models\Experience;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ExperienceResource extends Resource
{
    protected static ?string $model = Experience::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'admin3';

    public static function form(Schema $schema): Schema
    {
        return ExperienceForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return ExperienceInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ExperiencesTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListExperiences::route('/'),
            'create' => CreateExperience::route('/create'),
            'view' => ViewExperience::route('/{record}'),
            'edit' => EditExperience::route('/{record}/edit'),
        ];
    }
}
