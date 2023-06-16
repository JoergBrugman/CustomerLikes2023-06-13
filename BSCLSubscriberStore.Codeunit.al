codeunit 50200 "BSCL Subscriber Store"
{
    // [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, "BSB Favorite Book No.", true, true)]
    // local procedure CustOnAfterValidateFavBookNo(var Rec: Record Customer; var xRec: Record Customer)
    // begin
    //     if Rec."BSB Favorite Book No." <> xRec."BSB Favorite Book No." then
    //         Rec.Modify();
    // end;

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', true, true)]
    local procedure BookOnBeforeDelete(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;
        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeDeleteBookErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;

    var
        OnBeforeDeleteBookErr: Label 'You are not allowed to delete %1 %2 because it is liked by one or more customer';
}