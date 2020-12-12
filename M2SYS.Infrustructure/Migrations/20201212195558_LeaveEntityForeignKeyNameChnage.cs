using Microsoft.EntityFrameworkCore.Migrations;

namespace M2SYS.Infrastructure.Migrations
{
    public partial class LeaveEntityForeignKeyNameChnage : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Leaves_Employees_EmplyeeId",
                table: "Leaves");

            migrationBuilder.RenameColumn(
                name: "EmplyeeId",
                table: "Leaves",
                newName: "EmployeeId");

            migrationBuilder.RenameIndex(
                name: "IX_Leaves_EmplyeeId",
                table: "Leaves",
                newName: "IX_Leaves_EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Leaves_Employees_EmployeeId",
                table: "Leaves",
                column: "EmployeeId",
                principalTable: "Employees",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Leaves_Employees_EmployeeId",
                table: "Leaves");

            migrationBuilder.RenameColumn(
                name: "EmployeeId",
                table: "Leaves",
                newName: "EmplyeeId");

            migrationBuilder.RenameIndex(
                name: "IX_Leaves_EmployeeId",
                table: "Leaves",
                newName: "IX_Leaves_EmplyeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Leaves_Employees_EmplyeeId",
                table: "Leaves",
                column: "EmplyeeId",
                principalTable: "Employees",
                principalColumn: "Id");
        }
    }
}
