// This is a generated file - do not edit.
//
// Generated from protos/personnel.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'personnel.pb.dart' as $1;
import 'personnel.pbjson.dart';

export 'personnel.pb.dart';

abstract class PersonnelServiceBase extends $pb.GeneratedService {
  $async.Future<$1.LoginResponse> loginUser(
      $pb.ServerContext ctx, $1.LoginRequest request);
  $async.Future<$1.UserResponse> getUser(
      $pb.ServerContext ctx, $1.GetUserRequest request);
  $async.Future<$1.ListUsersResponse> listAllUsers(
      $pb.ServerContext ctx, $1.ListUsersRequest request);
  $async.Future<$1.UserResponse> updateUser(
      $pb.ServerContext ctx, $1.UpdateUserRequest request);
  $async.Future<$1.UserResponse> createUser(
      $pb.ServerContext ctx, $1.CreateUserRequest request);
  $async.Future<$1.DeleteResponse> deleteUser(
      $pb.ServerContext ctx, $1.DeleteUserRequest request);
  $async.Future<$1.UserResponse> updateDutyStatus(
      $pb.ServerContext ctx, $1.UpdateStatusRequest request);
  $async.Future<$1.ReportLocationResponse> reportLocation(
      $pb.ServerContext ctx, $1.LocationUpdate request);
  $async.Future<$1.SkillList> addUserSkill(
      $pb.ServerContext ctx, $1.SkillRequest request);
  $async.Future<$1.TeamListResponse> listAllTeams(
      $pb.ServerContext ctx, $0.Empty request);
  $async.Future<$1.UserListResponse> listUsersByTeam(
      $pb.ServerContext ctx, $1.ListUsersByTeamRequest request);
  $async.Future<$1.TeamResponse> getTeamDetails(
      $pb.ServerContext ctx, $1.GetTeamRequest request);
  $async.Future<$1.TeamResponse> createTeam(
      $pb.ServerContext ctx, $1.CreateTeamRequest request);
  $async.Future<$1.TeamResponse> updateTeam(
      $pb.ServerContext ctx, $1.UpdateTeamRequest request);
  $async.Future<$1.DeleteResponse> deleteTeam(
      $pb.ServerContext ctx, $1.DeleteTeamRequest request);
  $async.Future<$1.UserResponse> assignUserToTeam(
      $pb.ServerContext ctx, $1.AssignRequest request);
  $async.Future<$1.InstitutionListResponse> listInstitutions(
      $pb.ServerContext ctx, $0.Empty request);
  $async.Future<$1.InstitutionResponse> getInstitution(
      $pb.ServerContext ctx, $1.GetInstitutionRequest request);
  $async.Future<$1.InstitutionResponse> createInstitution(
      $pb.ServerContext ctx, $1.CreateInstitutionRequest request);
  $async.Future<$1.InstitutionResponse> updateInstitution(
      $pb.ServerContext ctx, $1.UpdateInstitutionRequest request);
  $async.Future<$1.DeleteResponse> deleteInstitution(
      $pb.ServerContext ctx, $1.DeleteInstitutionRequest request);
  $async.Future<$1.BranchListResponse> listBranches(
      $pb.ServerContext ctx, $1.ListBranchesRequest request);
  $async.Future<$1.BranchResponse> createBranch(
      $pb.ServerContext ctx, $1.CreateBranchRequest request);
  $async.Future<$1.BranchResponse> updateBranch(
      $pb.ServerContext ctx, $1.UpdateBranchRequest request);
  $async.Future<$1.DeleteResponse> deleteBranch(
      $pb.ServerContext ctx, $1.DeleteBranchRequest request);
  $async.Future<$1.CertificationListResponse> getUserCertifications(
      $pb.ServerContext ctx, $1.GetUserRequest request);
  $async.Future<$1.CertificationListResponse> addCertification(
      $pb.ServerContext ctx, $1.AddCertificationRequest request);
  $async.Future<$1.SkillList> listUserSkills(
      $pb.ServerContext ctx, $1.GetUserRequest request);
  $async.Future<$1.TaskListResponse> listTasks(
      $pb.ServerContext ctx, $1.ListTasksRequest request);
  $async.Future<$1.TaskResponse> createTask(
      $pb.ServerContext ctx, $1.CreateTaskRequest request);
  $async.Future<$1.TaskResponse> updateTaskStatus(
      $pb.ServerContext ctx, $1.UpdateTaskStatusRequest request);
  $async.Future<$1.DashboardStatsResponse> getDashboardStats(
      $pb.ServerContext ctx, $1.DashboardStatsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'LoginUser':
        return $1.LoginRequest();
      case 'GetUser':
        return $1.GetUserRequest();
      case 'ListAllUsers':
        return $1.ListUsersRequest();
      case 'UpdateUser':
        return $1.UpdateUserRequest();
      case 'CreateUser':
        return $1.CreateUserRequest();
      case 'DeleteUser':
        return $1.DeleteUserRequest();
      case 'UpdateDutyStatus':
        return $1.UpdateStatusRequest();
      case 'ReportLocation':
        return $1.LocationUpdate();
      case 'AddUserSkill':
        return $1.SkillRequest();
      case 'ListAllTeams':
        return $0.Empty();
      case 'ListUsersByTeam':
        return $1.ListUsersByTeamRequest();
      case 'GetTeamDetails':
        return $1.GetTeamRequest();
      case 'CreateTeam':
        return $1.CreateTeamRequest();
      case 'UpdateTeam':
        return $1.UpdateTeamRequest();
      case 'DeleteTeam':
        return $1.DeleteTeamRequest();
      case 'AssignUserToTeam':
        return $1.AssignRequest();
      case 'ListInstitutions':
        return $0.Empty();
      case 'GetInstitution':
        return $1.GetInstitutionRequest();
      case 'CreateInstitution':
        return $1.CreateInstitutionRequest();
      case 'UpdateInstitution':
        return $1.UpdateInstitutionRequest();
      case 'DeleteInstitution':
        return $1.DeleteInstitutionRequest();
      case 'ListBranches':
        return $1.ListBranchesRequest();
      case 'CreateBranch':
        return $1.CreateBranchRequest();
      case 'UpdateBranch':
        return $1.UpdateBranchRequest();
      case 'DeleteBranch':
        return $1.DeleteBranchRequest();
      case 'GetUserCertifications':
        return $1.GetUserRequest();
      case 'AddCertification':
        return $1.AddCertificationRequest();
      case 'ListUserSkills':
        return $1.GetUserRequest();
      case 'ListTasks':
        return $1.ListTasksRequest();
      case 'CreateTask':
        return $1.CreateTaskRequest();
      case 'UpdateTaskStatus':
        return $1.UpdateTaskStatusRequest();
      case 'GetDashboardStats':
        return $1.DashboardStatsRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'LoginUser':
        return loginUser(ctx, request as $1.LoginRequest);
      case 'GetUser':
        return getUser(ctx, request as $1.GetUserRequest);
      case 'ListAllUsers':
        return listAllUsers(ctx, request as $1.ListUsersRequest);
      case 'UpdateUser':
        return updateUser(ctx, request as $1.UpdateUserRequest);
      case 'CreateUser':
        return createUser(ctx, request as $1.CreateUserRequest);
      case 'DeleteUser':
        return deleteUser(ctx, request as $1.DeleteUserRequest);
      case 'UpdateDutyStatus':
        return updateDutyStatus(ctx, request as $1.UpdateStatusRequest);
      case 'ReportLocation':
        return reportLocation(ctx, request as $1.LocationUpdate);
      case 'AddUserSkill':
        return addUserSkill(ctx, request as $1.SkillRequest);
      case 'ListAllTeams':
        return listAllTeams(ctx, request as $0.Empty);
      case 'ListUsersByTeam':
        return listUsersByTeam(ctx, request as $1.ListUsersByTeamRequest);
      case 'GetTeamDetails':
        return getTeamDetails(ctx, request as $1.GetTeamRequest);
      case 'CreateTeam':
        return createTeam(ctx, request as $1.CreateTeamRequest);
      case 'UpdateTeam':
        return updateTeam(ctx, request as $1.UpdateTeamRequest);
      case 'DeleteTeam':
        return deleteTeam(ctx, request as $1.DeleteTeamRequest);
      case 'AssignUserToTeam':
        return assignUserToTeam(ctx, request as $1.AssignRequest);
      case 'ListInstitutions':
        return listInstitutions(ctx, request as $0.Empty);
      case 'GetInstitution':
        return getInstitution(ctx, request as $1.GetInstitutionRequest);
      case 'CreateInstitution':
        return createInstitution(ctx, request as $1.CreateInstitutionRequest);
      case 'UpdateInstitution':
        return updateInstitution(ctx, request as $1.UpdateInstitutionRequest);
      case 'DeleteInstitution':
        return deleteInstitution(ctx, request as $1.DeleteInstitutionRequest);
      case 'ListBranches':
        return listBranches(ctx, request as $1.ListBranchesRequest);
      case 'CreateBranch':
        return createBranch(ctx, request as $1.CreateBranchRequest);
      case 'UpdateBranch':
        return updateBranch(ctx, request as $1.UpdateBranchRequest);
      case 'DeleteBranch':
        return deleteBranch(ctx, request as $1.DeleteBranchRequest);
      case 'GetUserCertifications':
        return getUserCertifications(ctx, request as $1.GetUserRequest);
      case 'AddCertification':
        return addCertification(ctx, request as $1.AddCertificationRequest);
      case 'ListUserSkills':
        return listUserSkills(ctx, request as $1.GetUserRequest);
      case 'ListTasks':
        return listTasks(ctx, request as $1.ListTasksRequest);
      case 'CreateTask':
        return createTask(ctx, request as $1.CreateTaskRequest);
      case 'UpdateTaskStatus':
        return updateTaskStatus(ctx, request as $1.UpdateTaskStatusRequest);
      case 'GetDashboardStats':
        return getDashboardStats(ctx, request as $1.DashboardStatsRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => PersonnelServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => PersonnelServiceBase$messageJson;
}
