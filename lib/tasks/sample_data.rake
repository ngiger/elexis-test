namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    addUsers
    addLicenses
    addDeployStates
    addProductVersions
    if false
      addProductModules
      addTestEnvironments
      addTestResultType
      addTestSteps
      addTestCases
      addTestSuites
    end
  end

  def addUsers
    admin = User.create!(:name => "Example User",
    :email => "example@railstutorial.org",
    :password => "foobar",
    :password_confirmation => "foobar")
    admin.toggle!(:admin)

    admin = User.create!(:name => "Administrator",
    :email => "rgw@elexis.ch",
    :password => "admin",
    :password_confirmation => "admin")
    admin.toggle!(:admin)

    admin = User.create!(:name => "Niklaus Giger",
    :email => "niklaus.giger@member.fsf.org",
    :password => "admin",
    :password_confirmation => "admin")
    admin.toggle!(:admin)

    5.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
      :email => email,
      :password => password,
      :password_confirmation => password)
    end
  end

  def addLicenses
    lic = LicenseType.create!(:name =>"EPL 1.0",
    :description => "Eclipse Public License Version 1.0")
    lic = LicenseType.create!(:name =>"Medelexis",
    :description => "Copyright 2011 by Medelexis")
    lic = LicenseType.create!(:name =>"Medshare",
    :description => "Copyright 2011 by Medshare")
  end

  def addDeployStates
    state = DeployState.create!(:name =>"Planned",
    :description => "Release is planned")
    state = DeployState.create!(:name =>"Under Test",
    :description => "Release is being tested")
    state = DeployState.create!(:name =>"Release",
    :description => "Release is finished.")
  end

  def addProductModules
    pm = ProductModule.create!(:name =>"elexis-core",
    :description => "Kern-Module von Elexis",
    :license_type_id => 1)
    pm = ProductModule.create!(:name =>"KG-Iatrix",
    :description => "Krankengeschichte von Iatrix",
    :license_type_id => 2)
  end

  def addTestEnvironments
    te = TestEnvironment.create!(:name =>"runFromScratch",
    :description => "Leere Datenbank")
    te = TestEnvironment.create!(:name =>"rgw",
    :description => "Anonmyisierte DB von rgw")
    te = TestEnvironment.create!(:name =>"Praxis-Test",
    :description => "Test-Datenbank der Arztpraxi")
  end

  def addTestResultType
    tr = TestResultType.create!(:name =>"OK",
    :description => "Keine Fehler gefunden")
    tr = TestResultType.create!(:name =>"Not run",
    :description => "Test nicht durchgefuehrt. Bitte Grundangeben weshalb. z.B. Zeitmangel")
    tr = TestResultType.create!(:name =>"Tolerierbare Fehler",
    :description => "Fehler, welche die Funktion nicht wesentliche beintraechtigen, z.B. Tippfehler")
    tr = TestResultType.create!(:name =>"Neu aufgetauchter Fehler",
    :description => "Fehler, den der Tester noch nie gesehen hat")
    tr = TestResultType.create!(:name =>"Bekannter Fehler",
    :description => "Fehler, den der Tester schon in frueheren Versionen gesehen hat. Bitte angeben, wann, wie, wo")
    tr = TestResultType.create!(:name =>"Release-kritisch",
    :description => "Fehler, der unbedingt behoben werden muss, bevor die Version freigegeben werden kann")
  end

  def addProductVersions
    tr = ProductVersion.create!(:name =>"2.1.2",
    :description => "Elexis. Produktive Version vom April 2011",
    :remarks     => "Letzte Version von Gerry Weirich. Geloeste Probleme sind: a,b,c")
    tr = ProductVersion.create!(:name =>"2.1.5",
    :description => "Elexis 2.1.5. Geplant Ende Juni 2011",
    :remarks     => "Erste von Niklaus betreute Version. Neu sind: dbcheck, quality feedback, KG-Iatrix, viele Bug-Fixes")
  end

  def addTestSteps
    ts = TestStep.create!(:name =>"Patient erstellen",
    :description => "Patient Max Mueller, m, 1.1.1950, tst@tst.org, 055 612 20 54 erstellen",
    :criteria => "Patient konnte erfasst werden und taucht in der Liste aller Patienten auf",
    :product_module_id => 1,
    :test_case_id => 1,
    :smoketest => true);
    ts = TestStep.create!(:name =>"Agendaeintrag loeschen",
    :description => "Patient Max Mueller, auswaehlen, Agenda eintrag loeschen",
    :criteria => "Agendaeintrag konnte geloescht werden und taucht im Gewaehlten Datum nicht mehr auf",
    :product_module_id => 1,
    :test_case_id => 1,
    :smoketest => false);
  end

  def addTestCases
    tc = TestCase.create!(:name =>"Patienten",
    :product_module_id => 1,
    :test_environment_id => 1,
    :estimated_time => 10, # in Minuten
    #:test_suite_id =>1,
    :test_step_id =>1
    );
    tc = TestCase.create!(:name =>"Agenda",
    :product_module_id => 1,
    :test_environment_id => 1,
    :estimated_time => 10, # in Minuten
    #:test_suite_id =>1,
    :test_step_id =>2);
  end

  def addTestSuites
    ts = TestSuite.create!(
    # test_suite_id => 1,
    # remarks => "Unsere erste Testsuite kann noch nicht viel",
    user_id => 1,
    closed => null,
    test_result_type_id => 2,
    test_case_id => 1) if false
  end

end
