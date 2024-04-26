abstract class BMIState {}
class BMIInitial extends BMIState {}
class BMISendLoading extends BMIState {}
class BMISendError extends BMIState {}
class BMISendSuccess extends BMIState {}
class BMICalculating extends BMIState {}
class LoadingBMIListState extends BMIState{}
class SucessBMIListState extends BMIState{}
class ErrorBMIListState extends BMIState{}
class OnRefrishLoading extends BMIState{}
class OnPaginationLoading extends BMIState{}
class OnRefrishEnd extends BMIState{}
class OnPaginationEnd extends BMIState{}
class DeleteLoadingState extends BMIState{}
class DeleteSoccessState extends BMIState{}
class DeleteErrorState extends BMIState{}
class UpdateLoadingState extends BMIState{}
class UpdateSoccessState extends BMIState{}
class UpdateErrorState extends BMIState{}

