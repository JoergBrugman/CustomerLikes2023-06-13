pageextension 50201 "BSCL Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(navigation)
        {
            action("BSCL ShowFavoriteBook")
            {
                Caption = 'Favorite Book';
                Image = Card;
                ToolTip = 'Executes the Favorite Book action.';
                ApplicationArea = All;
                Enabled = Rec."BSB Favorite Book No." <> '';

                trigger OnAction()
                begin
                    Rec.ShowFavoriteBook();
                end;
            }
        }
    }
}